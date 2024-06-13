#参考記事）
#https://qiita.com/ingtk/items/e1bd500a7d6d95968d3c
#https://serverspec.org/advanced_tips.html

#===ライブラリのImport===
require 'serverspec'
require 'net/ssh'

#===SSH接続してテストできる環境を設定===
set :backend, :ssh

host = ENV['TARGET_HOST'] #circleci>config.ymlで設定したenvironmentのTARGET_HOSTの中身targetを取得
options = Net::SSH::Config.for(host)
#Net::SSH::Configメソッド(ライブラリ)が~/.ssh/configファイルを読み取って、Hostがtargetとなっている配下の記述(IPやUserなど)を取得してくれる

set :host, host
set :ssh_options, options

# set :disable_sudo, true #テストスクリプトをsudoを使わずに実行する

set :path, '/sbin:/usr/sbin:/usr/local/sbin:$PATH' 
#テストが実行される環境のPATH変数を設定→/sbin, /usr/sbin, /usr/local/sbinなどのディレクトリにあるコマンドを実行できる
