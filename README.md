# serverspec + WinRM 手習い

WinRM を使って Windows のサーバを serverspec でテストする練習。とその[メモ書き](https://gist.github.com/buzztaiki/9351224)。

## 動かす

1. Windows のサーバを準備して `properties.yml` の名前で繋がるようにする

2. 各サーバで `setup-winrm.bat` を実行して WinRM が使えるようにする

4. 各サーバのパスワードを `secret.yml` に書く

        win2012.buzztaiki.ec2:
          :pass: ***
        ...

5. serverspec を使えるようにする

        $ bundle

6. 動かす

        $ rake spec
