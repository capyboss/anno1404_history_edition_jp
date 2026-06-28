============================================================
 Anno 1404 History Edition  日本語化パッチツール
============================================================

【これは何か】
 オリジナル(英語版)のインストールから、ゲーム本体を日本語化する
 ツールです。英語版アーカイブ maindata\eng0.rda を展開し、日本語
 テキストと日本語フォント設定を上書きして再パックし、ゲームに適用
 します。537MBの完成品を配るのではなく、3MBの日本語差分だけを持ち、
 各自のオリジナル環境からその場で日本語版を生成します。

【動作対象】
 ・Anno 1404 - History Edition (Steam AppID 1281630)
 ・本体(maindata)を日本語化します。Venice(アドオン)のテキストも
   含みます。Veniceのテキストは本体 maindata/eng0.rda の
   data/loca/eng/txt/addon/ に格納されているため、本体の差し替えで
   一緒に日本語化されます(addon/eng0.rda は音声のみで未改変)。

【使い方】
 1. apply_jp.bat をダブルクリックして実行。
    - Steam既定パスを自動で使います:
      C:\Program Files (x86)\Steam\steamapps\common\Anno 1404 - History Edition
    - 別ドライブ等にある場合は、ゲームのフォルダを apply_jp.bat に
      ドラッグ＆ドロップして実行してください。
      (または: apply_jp.bat "D:\...\Anno 1404 - History Edition")
 2. 「展開→上書き→再パック→適用」が自動で進みます(数分)。
 3. [OK] と出れば完了。ゲームを起動して日本語表示を確認してください。

【元に戻す】
 ・restore_en.bat を実行すると、バックアップ(eng0.rda.ORIGINAL)から
   英語版に戻します。
 ・バックアップが無い場合は、Steamの「ゲームファイルの整合性を確認」
   で英語版に戻せます。

【Steamアップデート / 整合性確認のあと】
 ・eng0.rda が英語版に戻ります。その場合は apply_jp.bat を
   もう一度実行すれば再び日本語化されます。

【中身】
 ・RdaConsole.exe          ... RDAアーカイブの展開/パックCLI
 ・jp_files\data\loca\eng\ ... 日本語化済みファイル(差分の実体)
     txt\*.txt            ... 英語テキストに日本語をマージしたもの
     localisation.xml     ... フォントを Meiryo に変更したもの
 ・apply_jp.bat            ... 適用ツール
 ・restore_en.bat          ... 英語版に戻すツール
 ・eng0_new.rda            ... 実行後に生成される日本語版(中間生成物)

【仕組みのメモ】
 ・HEでは loose file や override archive(eng1.rda 等)は無視されるため、
   eng0.rda そのものを差し替える必要があります。本ツールは英語版を
   展開→日本語ファイルを上書き→丸ごと再パック、で正しい eng0.rda を
   作り直しています。
 ・フォントはGDIの名前指定フォントで描画されるため、Meiryo等の
   CJKフォント名を指定するだけでよく、EXEパッチは不要です。

【クレジット / 利用させていただいた素材】
 ・日本語翻訳データ
     anno1404mod (Dawn of Discovery Venice 日本語化パッチ) より利用。
     https://sites.google.com/site/anno1404mod/
     本体およびVenice(アドオン)の日本語テキストは、こちらの翻訳を
     History Edition の英語テキストにGUID単位でマージしたものです。
     翻訳者の皆様に深く感謝いたします。
 ・RDAアーカイブ展開/パック
     RdaConsole (anno-mods) … RDAファイル操作ツール。本ツールに同梱。
     https://github.com/anno-mods/RdaConsole
     これは lysannschlegel 氏の RDAExplorer を全面的にベースに、
     コンソール操作を追加したものです。
     https://github.com/lysannschlegel/RDAExplorer

【免責 / 自己責任でのご利用のお願い】
 ・本ツールおよび同梱物の利用は、すべて自己責任でお願いいたします。
 ・本ツールを使用して生じたいかなる損害(セーブデータの破損、ゲームが
   起動しなくなる等)についても、作者および上記素材の各作者は一切の
   責任を負いません。
 ・適用前に必ずバックアップ(本ツールが作る eng0.rda.ORIGINAL、または
   Steamの整合性確認での復元)が可能なことをご確認ください。
 ・本ツールは個人的な日本語化を目的としたものです。再配布の際は
   上記素材の各配布元の規約に従ってください。
