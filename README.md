## xe-rub-bitbar-plugin
Plugin for [BitBar](https://github.com/matryer/bitbar).
\*/RUB currency pair from [xe.com](http://www.xe.com/)

###Sign mode
![BitBar Example showing plugin](https://raw.github.com/romankrasavtsev/xe-rub-bitbar-plugin/master/xe_rub_sign.png)

###Emoji mode
![BitBar Example showing plugin](https://raw.github.com/romankrasavtsev/xe-rub-bitbar-plugin/master/xe_rub_emoji.png)

### Supported currencies
 - USD - United States dollar 🇺🇸
 - EUR - Euro 🇪🇺
 - GBP - British pound 🇬🇧
 - CHF - Swiss franc 🇨🇭
 - JPY - Japanese yen 🇯🇵
 - CNY - Chinese yuan 🇨🇳
 - CAD - Canadian dollar 🇨🇦
 - TRY - Turkish lira 🇹🇷

 > You could try to use another currency, but you should add sign to get_sign method.

### How to use
 - Install ruby
 - Install gem [nokogiri](http://www.nokogiri.org/tutorials/installing_nokogiri.html)
 - Drop xe_rub.15m.rb file into your BitBar plugins folder
 - Make sure it's executable (in Terminal, do chmod +x moex.1m.rb)
 - Edit xe_rub.15m.rb and add your currencies
 - Choose emoji or sign mode (emoji = true / false)
