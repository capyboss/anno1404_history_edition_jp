# anno1404_history_edition_jp

**Anno 1404 - History Edition 日本語化パッチツール**

オリジナル（英語版）のインストールから、ゲーム本体を日本語化するツールです。
英語版アーカイブ `maindata\eng0.rda` を展開し、日本語テキストと日本語フォント設定を
上書きして再パックし、ゲームに適用します。

537MB の完成品を配るのではなく、**約 3MB の日本語差分だけ**を持ち、各自のオリジナル環境から
その場で日本語版を生成します。

## 動作対象

- Anno 1404 - History Edition（Steam AppID `1281630`）
- 本体（maindata）を日本語化します。**Venice（アドオン）のテキストも含みます。**
  Venice のテキストは本体 `maindata/eng0.rda` の `data/loca/eng/txt/addon/` に格納されているため、
  本体の差し替えで一緒に日本語化されます（`addon/eng0.rda` は音声のみで未改変）。

## 使い方

1. `apply_jp.bat` をダブルクリックして実行します。
   - Steam 既定パスを自動で使います：
     `C:\Program Files (x86)\Steam\steamapps\common\Anno 1404 - History Edition`
   - 別ドライブ等にある場合は、ゲームのフォルダを `apply_jp.bat` にドラッグ＆ドロップして実行してください。
     （または `apply_jp.bat "D:\...\Anno 1404 - History Edition"`）
2. 「展開 → 上書き → 再パック → 適用」が自動で進みます（数分）。
3. `[OK]` と出れば完了です。ゲームを起動して日本語表示を確認してください。

## 元に戻す

- `restore_en.bat` を実行すると、バックアップ（`eng0.rda.ORIGINAL`）から英語版に戻します。
- バックアップが無い場合は、Steam の「ゲームファイルの整合性を確認」で英語版に戻せます。

### Steam アップデート / 整合性確認のあと

`eng0.rda` が英語版に戻ります。その場合は `apply_jp.bat` をもう一度実行すれば再び日本語化されます。

## 中身

| ファイル / フォルダ | 説明 |
| --- | --- |
| `RdaConsole.exe` | RDA アーカイブの展開 / パック CLI |
| `jp_files\data\loca\eng\` | 日本語化済みファイル（差分の実体） |
| `jp_files\...\txt\*.txt` | 英語テキストに日本語をマージしたもの |
| `jp_files\...\localisation.xml` | フォントを Meiryo に変更したもの |
| `apply_jp.bat` | 適用ツール |
| `restore_en.bat` | 英語版に戻すツール |
| `eng0_new.rda` | 実行後に生成される日本語版（中間生成物） |

## 仕組みのメモ

- HE では loose file や override archive（`eng1.rda` 等）は無視されるため、`eng0.rda` そのものを
  差し替える必要があります。本ツールは英語版を展開 → 日本語ファイルを上書き → 丸ごと再パック、で
  正しい `eng0.rda` を作り直しています。
- フォントは GDI の名前指定フォントで描画されるため、Meiryo 等の CJK フォント名を指定するだけでよく、
  EXE パッチは不要です。

## クレジット / 利用させていただいた素材

- **日本語翻訳データ** — [anno1404mod（Dawn of Discovery Venice 日本語化パッチ）](https://sites.google.com/site/anno1404mod/) より利用。
  本体および Venice（アドオン）の日本語テキストは、こちらの翻訳を History Edition の英語テキストに
  GUID 単位でマージしたものです。翻訳者の皆様に深く感謝いたします。
- **RDA アーカイブ展開 / パック** — [RdaConsole（anno-mods）](https://github.com/anno-mods/RdaConsole)。RDA ファイル操作ツール。本ツールに同梱。
  これは lysannschlegel 氏の [RDAExplorer](https://github.com/lysannschlegel/RDAExplorer) を全面的にベースに、コンソール操作を追加したものです。

## 免責 / 自己責任でのご利用のお願い

- 本ツールおよび同梱物の利用は、すべて自己責任でお願いいたします。
- 本ツールを使用して生じたいかなる損害（セーブデータの破損、ゲームが起動しなくなる等）についても、
  作者および上記素材の各作者は一切の責任を負いません。
- 適用前に必ずバックアップ（本ツールが作る `eng0.rda.ORIGINAL`、または Steam の整合性確認での復元）が
  可能なことをご確認ください。
- 本ツールは個人的な日本語化を目的としたものです。再配布の際は上記素材の各配布元の規約に従ってください。
