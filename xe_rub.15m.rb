#!/usr/bin/env ruby

# <bitbar.title>EUR/RUB Currency Pair</bitbar.title>
# <bitbar.version>v1.0</bitbar.version>
# <bitbar.author>Roman Krasavtsev</bitbar.author>
# <bitbar.author.github>RomanKrasavtsev</bitbar.author.github>
# <bitbar.desc>EUR/RUB Currency Pair from xe.com</bitbar.desc>
# <bitbar.image>https://raw.github.com/romankrasavtsev/bitbar-plugins/master/eur_rub_emoji.png</bitbar.image>
# <bitbar.dependencies>ruby</bitbar.dependencies>
# <bitbar.abouturl>https://github.com/RomanKrasavtsev/bitbar-plugins</bitbar.abouturl>

require "nokogiri"
require "open-uri"

def get_exchange_rate emoji, *currencies
  result_string = ""

  currencies.each do |currency|
    sign = get_sign emoji, currency

    rate = Nokogiri::HTML(open("http://www.xe.com/currencyconverter/convert/?Amount=1&From=#{currency}&To=RUB"))
      .css(".uccRes .rightCol")
      .to_s
      .gsub(/<td width="47%" align="left" class="rightCol">/, "")
      .gsub(/<span class="uccResCde">RUB<\/span>/, "")
      .gsub(/<!-- WARNING: Automated extraction of rates is prohibited under the Terms of Use. -->/, "")
      .gsub(/<\/td>/, "")
      .gsub(/\./, ",")
      .slice(/\d+,\d./)

    result_string += "#{sign} #{rate}  "
  end

  result_string
end

def get_sign emoji, currency
  case currency
  when "USD"
    sign  = emoji ? "🇺🇸" : "$"
  when "EUR"
    sign = emoji ? "🇪🇺" : "€"
  when "GBP"
    sign = emoji ? "🇬🇧" : "£"
  when "CHF"
    sign = emoji ? "🇨🇭" : "Fr"
  when "JPY"
    sign = emoji ? "🇯🇵" : "J¥"
  when "CNY"
    sign = emoji ? "🇨🇳" : "C¥"
  when "CAD"
    sign = emoji ? "🇨🇦" : "C$"
  when "TRY"
    sign = emoji ? "🇹🇷" : "₺"
  else
    sign = "Unknown currency"
  end

  sign
end

# Supported currencies:
# USD - United States dollar
# EUR - Euro
# GBP - British pound
# CHF - Swiss franc
# JPY - Japanese yen
# CNY - Chinese yuan
# CAD - Canadian dollar
# TRY - Turkish lira

emoji = true
puts get_exchange_rate emoji, "USD", "EUR", "GBP", "CAD"
