=begin

== カスタマイズ

「漢直Win」のカスタマイズに関連するファイルは、
次の 3 種です。

* ((<初期設定ファイル>)) (kanchoku.ini)
* ((<キーボードファイル>)) (106.key, 101.key など)
* ((<テーブルファイル>)) (t.tbl, tut.tbl など)

((<初期設定ファイル>)) (kanchoku.ini) は、
「漢直Win」の動作を設定する設定ファイルです。
通常は、このファイルを編集するだけでよいでしょう。

((<キーボードファイル>)) (*.key) は、
「漢直Win」で使用するキーを設定する設定ファイルです。
通常は、このファイルを変更する必要はありませんが、
特殊なキーボードを使用したり、キーレイアウトを変更したりしている場合は、
キーボードファイルを編集したり、
新しく作成したりする必要があるかも知れません。

((<テーブルファイル>)) (*.tbl) は、
T-Code や TUT-Code などの入力方式の、
文字とストロークの対応を定義する設定ファイルです。
部首合成や交ぜ書き変換、かたかなモードなどの機能キーの割り当ても、
このファイルで設定します。
また、独自のコードを作成する場合は、
テーブルファイルを新しく作成することになります。

=== 初期設定ファイル

初期設定ファイル kanchoku.ini は、
「漢直Win」の動作を設定する設定ファイルです。

使用する入力方式 (T-Code, TUT-Code など) や
キーボードを指定するには、この設定ファイルを編集します。

* kanchoku.ini の書式は、Windows で一般的に用いられる INI 形式です。
* セミコロン ((({;}))) から行末までは、コメントとして読みとばされます。
* 「漢直Win」の設定オプションは、
  (({[kanchoku]})) セクションに記述します。

  ■(({[kansaku]})) セクションには、
  ((<漢索窓>)) の設定オプションを記述する場所なので、ここには
  「漢直Win」の設定を書かないようにしましょう。□

==== 「漢直Win」の起動
「漢直Win」の起動に関するオプションです。
:(({hotKey=((|xx|))}))
  [kanchoku.ini のデフォルト: dc (すなわち、((%Ctrl%))+((%\%))); 省略時: dc]

  ((|xx|)) に、ホットキー (ON/OFF のトグルに使用するキー) を、
  16 進表記の ((<仮想キーコード>)) で指定します。
  ここで指定したキーと、((%Ctrl%)) を同時に押すことで、ON/OFF をトグルします。

  たとえば、((%Ctrl%))+((%Space%)) をホットキーにするには、
  次のように記述します。
    hotKey=20

:(({unmodifiedHotKey=((|xx|))}))
  [kanchoku.ini のデフォルト: (なし); 省略時: (なし)]

  [^[((<ver1.27d|変更履歴>))]^]
  (({hotKey=((|xx|))})) と同様ですが、
  ここで設定したホットキーは単独で働き、((%Ctrl%)) を押す必要がありません。

  たとえば、((%変換%)) キーをホットキーにするには、
  次のように記述します。
    unmodifiedHotKey=1c

(({hotKey=((|xx|))})) と (({unmodifiedHotKey=((|xx|))})) の指定は両立します。
たとえば、
  hotKey=1c
  unmodifiedHotKey=1c
と記述すれば、((%変換%)) と ((%Ctrl%))+((%変換%)) の両方が
ホットキーになります。

:(({offHotKey=((|xx|))}))
  [kanchoku.ini のデフォルト: (なし); 省略時: (なし)]

  ((|xx|)) に、「漢直Win」を OFF にするキーを、
  16 進表記の ((<仮想キーコード>)) で指定します。
  ここで指定したキーと、((%Ctrl%)) を同時に押すことで、
  「漢直Win」を OFF にします。

  (({offHotKey=((|xx|))})) を指定した場合、
  (({hotKey=((|xx|))})) で指定したキーは、
  ON/OFF のトグルではなく、ON にするキーとして働きます。

:(({unmodifiedOffHotKey=((|xx|))}))
  [kanchoku.ini のデフォルト: (なし); 省略時: (なし)]

  (({offHotKey=((|xx|))})) と同様ですが、
  ここで設定したホットキーは単独で働き、((%Ctrl%)) を押す必要がありません。

  (({unmodifiedOffHotKey=((|xx|))})) を指定した場合、
  (({unmodifiedHotKey=((|xx|))})) で指定したキーは、
  ON/OFF のトグルではなく、ON にするキーとして働きます。

ホットキーに設定したキー (((%Ctrl%))+((%\%)) や ((%変換%)) など) は、
つねに「漢直Win」が取ってしまうので、
(「漢直Win」を終了しない限りは) ソフトに渡すことはできなくなります。
((*((*キーは慎重に選んでください。*))*))

==== 入力方式
入力方式関連のオプションです。
:(({keyboard=((|file|))}))
  [kanchoku.ini のデフォルト: 106.key; 省略時: 106.key]

  ((|file|)) に、((<キーボードファイル>)) を指定します。
  * 106.key … 日本語配列のキーボード (106 配列、109 配列)
  * 101.key … 英語配列のキーボード (101 配列、104 配列)
  * dvorak.key … Dvorak 配列のキーボード
:(({tableFile=((|file|))}))
  [kanchoku.ini のデフォルト: t.tbl; 省略時: t.tbl]

  ((|file|)) に、((<テーブルファイル>)) を指定します。
  * t.tbl … T-Code
  * tut.tbl … TUT-Code
  * g.tbl … G-Code

==== 補助入力
補助入力関連のオプションです。
:(({bushu=((|file|))}))
  [kanchoku.ini のデフォルト: kwbushu.rev; 省略時: (なし)]

  ((|file|)) に、部首合成変換の辞書ファイルを指定します。
  指定しない場合は、部首合成変換を使用しない設定になります。
:(({bushuAlgo=[OKA | YAMANOBE]}))
  [kanchoku.ini のデフォルト: YAMANOBE; 省略時: OKA]
  
  [^[((<ver1.27f|変更履歴>))]^]
  部首合成変換のアルゴリズムを指定します。
  * (({bushuAlgo=OKA})) 
    … 岡さんによるアルゴリズムを使用します。
  * (({bushuAlgo=YAMANOBE})) 
    … 山辺さんによるアルゴリズム [tcode-ml:2652] を使用します。
  岡さんのアルゴリズムは、漢直Win の従来のアルゴリズムです。
  山辺さんのアルゴリズムは、文字をより細かく分解して合成を行うもので、
  たとえば、「準 + シ」は「汁」ではなく「隼」となります。
  岡さんのアルゴリズムは、
  tc.el や 
  ((<T-Code for Macintosh|URL:http://openlab.jp/tcode/soft.html">)) などに近く、
  山辺さんのアルゴリズムは、((<tc2|"直接入力ソフト">)) 
  (特にバージョン 2.2 以降?) に近いと思われます。
  
  指定しない場合は、岡さんによるアルゴリズムを用います。
:(({mazegaki=((|file|))}))
  [kanchoku.ini のデフォルト: kwmaze.dic; 省略時: (なし)]

  ((|file|)) に、交ぜ書き変換の辞書ファイルを指定します。
  指定しない場合は、交ぜ書き変換を使用しない設定になります。
:(({conjugationalMaze=((|n|))}))
  [kanchoku.ini のデフォルト: 2; 省略時: 1]

  活用語を交ぜ書き変換する際の、読みの入力のしかたを指定します。
  たとえば、
  ((<交ぜ書き変換辞書>))に (({はな― /話/})) というエントリがあるとして、
  「話」と変換しようとしたとき、
  * (({conjugationalMaze=0})) 
    … 「はな―」(辞書に書いてあるそのままの形) でのみ、変換可能。
  * (({conjugationalMaze=1})) 
    … 「はな―」、「はな」(語幹) でのみ、変換可能
  * (({conjugationalMaze=2})) 
    … 「はなす」「はなさない」「はなします」などの活用形で変換可能[^[((<ver1.27f|変更履歴>))]^]
  となります。

:(({gg=((|file|))}))
  [kanchoku.ini のデフォルト: (なし); 省略時: (なし)]

  [^[((<ver1.27a|変更履歴>))]^]
  ((|file|)) に ((<熟語ガイド>)) の辞書ファイルを指定します。
  指定しない場合は、熟語ガイドを使用しない設定になります。

:(({defg=((|string|))}))
  [kanchoku.ini のデフォルト: (なし); 省略時: (なし)]

  [^[((<ver1.27e|変更履歴>))]^]
  ((<熟語ガイド>)) 使用時に、デフォルトの状態 (ガイドすべき文字がない場合)
  で表示する文字を並べて指定します。

:(({prefixautoassign=((|string|))}))
  [kanchoku.ini のデフォルト: (なし); 省略時: (なし)]

  [^[((<ver1.28|変更履歴>))]^]
  ((<熟語ガイド>)) 使用時に、外字に一時的にストロークを割り振る機能で用いる
  ストロークを矢印定義形式で指定します。

:(({maze2gg=((|n|))}))
  [kanchoku.ini のデフォルト: 0; 省略時: 0]

  [^[((<ver1.28|変更履歴>))]^]
  「漢直Win」起動時に ((<強制練習モード>)) が有効かどうかを指定します。

:(({record=((|file|))}))
:(({stat=((|file|))}))
  [kanchoku.ini のデフォルト: kwrecord.txt, kwstat.txt; 省略時: (なし)]

  [^[((<ver1.27f|変更履歴>))]^]
  ((<入力の統計>))を記録するファイル名を指定します。

==== 文字入力
文字入力に関するオプションです。
:(({shiftKana=((|n|))}))
  [kanchoku.ini のデフォルト: 0; 省略時: 0]

  ((|n|)) に 1 を指定すると、シフト打鍵で、
  ひらがなをかたかなに変換して入力します。
  [:del:]ただし、
  本来シフトを用いて入力する文字 (大文字や記号など) は入力できなくなります。
  [:/del:]
  なお、
  シフト打鍵は、かな文字の入力に使うキーだけを「漢直Win」側で取り、
  それ以外のキーのシフト打鍵は、
  通常の打鍵として扱われます[^[((<ver1.27a|変更履歴>))]^]。

:(({enableHankakuKana=((|n|))}))
  [kanchoku.ini のデフォルト: 0; 省略値: 0]

  [^[((<ver1.27f|変更履歴>))]^]
  ((|n|)) に 1 を指定すると、((<全角モード>)) 時に、
  かたかなを半角かなに変換します。

:(({fallbackOnUnshift=((|n|))}))
  [kanchoku.ini のデフォルト: (省略値); 省略値: ((|shiftKana|))]

  [^[((<ver1.28|変更履歴>))]^]
  ((|n|)) に 1 を指定すると、シフト打鍵の定義がない場合に
  シフトなし打鍵の定義で代用します。

  部分的にシフト打鍵を定義したテーブルファイルを使用する場合や、
  lockStrokeByShiftを用いる場合に指定して下さい。

:(({lockStrokeByShift=((|n|))}))
  [kanchoku.ini のデフォルト: 0; 省略値: 0]

  [^[((<ver1.28|変更履歴>))]^]
  打鍵をシフトと組み合わせることでストロークロック機能が働きます。なお、すべての文字キー
  （キーボードファイルにあるキー）のシフト打鍵を「漢直Win」側で取ってしまうため、
  本来シフトを用いて入力する文字 (大文字や記号など) は F_VERB_FIRST を使う等しないと
  入力できなくなります。

  * 1 … シフトなし打鍵のストロークがシフト打鍵でロックされ、シフト打鍵が続く間ロックされ、
    シフトなし打鍵が来るとロック解除＆その打鍵が第一打となります。
    ただしロック解除状態で第一打をシフト打鍵してもロックされず、続けてシフト打鍵すると
    第一打がロック対象となります。


==== 送出メッセージ
送出メッセージに関するオプションです。
:(({outputMethod=((|n|))}))
:(({useWMIMECHAR=((|n|))}))
  [kanchoku.ini のデフォルト: 0; 省略時: 0]

  「漢直Win」がアプリケーションに文字を送出するときに用いる
  送出メッセージを指定します。指定できる値は、
  * 0 (WM_CHAR)
  * 1 (WM_IME_CHAR)
  * 2 (WM_KANCHOKU_CHAR; フックと ImmSetCompositionString を組み合わせて
    入力するための独自のメッセージ
    [^[((<ver1.27f|変更履歴>))]^])
  * 3 (WM_UNICHAR
    [^[((<ver1.28|変更履歴>))]^])
  です。

  WindowsNT/2000/XP では 0 を、
  Windows95/98/Me では 1 を指定しておいた方がいいようです。
  
  特定のアプリケーションで「漢直Win」が使えない場合は、
  後述の ((<ウィンドウクラスごとに送出メッセージを指定>)) の方法を
  試してみてください[^[((<ver1.27f|変更履歴>))]^]。
:(({enableWMKANCHOKUCHAR=((|n|))}))
  [kanchoku.ini のデフォルト: 1; 省略時: 0]

  [^[((<ver1.27f|変更履歴>))]^]
  (({outputMethod=2})) を使用する場合は、((|n|)) に 1 を指定しておきます。

:(({outputSleep=((|n|))}))
  [kanchoku.ini のデフォルト: 2; 省略時: 0]

  [^[((<ver1.27a,f,1.28|変更履歴>))]^]
  キー送出時に Sleep() する待ち時間 (単位はミリ秒) を指定します。
  デフォルトは 2 ですが、
  次のような場合には、適当に値を増やして指定してみてください。
  * ((<後置型の変換>)) で、
    変換した文字がうまく置き換えられない場合
  * 入力の取りこぼしがある場合
  * ((%BackSpace%)) や ((%Enter%)) が重複して入力されてしまう場合
  ただし、(({useCtrlKey=2})) の場合や XKeymacs 等を併用している場合には、
  あまり値を増やすと ((%C-h%)) が ((%h%)) に化けるといった別の問題が生じます。
:(({outputVKeyMethod=((|n|))}))
  [kanchoku.ini のデフォルト: 0; 省略時: 0]

  [^[((<ver1.28|変更履歴>))]^]
  「漢直Win」がアプリケーションに ((%BackSpace%)) や ((%Enter%)) 等の仮想キーを
  送出するときに用いる送出メッセージを指定します。指定できる値は、
  * 0 (WM_KEYDOWN, WM_KEYUP を PostMessage)
  * 1 (keybd_event)
  です。1 を指定することで、IME にキー操作が伝わるようになり、F_VERB_FIRST 等では
  IME にローマ字入力ができるようになります。ただし現在の「漢直Win」は IME
  の未確定文字列等へのケアがありませんので、使用の際はご注意ください。

:(({outputAlphabetAsVKey=((|n|))}))
  [kanchoku.ini のデフォルト: 0; 省略時: 0]

  [^[((<ver1.28a|変更履歴>))]^]
  ((|n|)) に 1 を指定すると、テーブルファイルの文字列定義中の英小文字が
  仮想キーとして送出されるようになります。(({outputVKeyMethod=1})) と併用して、
  「漢直Win」をかな配列カスタマイズソフトとして使えるかもしれません。

==== ウィンドウクラスごとに送出メッセージを指定
[^[((<ver1.27f|変更履歴>))]^] 
送出メッセージ (({outputMethod})) は、
アプリケーションごとに (正確には、ウィンドウクラスごとに) 
指定することができます。

指定したいアプリケーションごとに、次のような記述を適宜追加してください。
  [<識別子>]
  className=<ウィンドウクラス名>
  outputMethod=<送出メッセージ>

(({<識別子>})) は、何でもよいのですが、
対象アプリケーションの名前を英字で書くのがよいでしょう。
他のものとぶつからないように適当に命名します。

(({<ウィンドウクラス名>})) は、設定を行いたいウィンドウクラス名を指定します。
ウィンドウクラス名は、付属のツール wininfo.exe で調べることができます。
wininfo.exe を起動し (「漢直Win」は終了しておきます)、
調べたいウィンドウをアクティブにして、((%Ctrl%))+((%\%)) キーを押すと、
入力フォーカスを持つウィンドウのクラス名が取得されるので、
それを書いておきます。

(({<送出メッセージ>})) には、0, 1, 2 のいずれかを指定します。
前述の全般的な ((<送出メッセージ>)) で
(({outputMethod=0})) を指定した場合は、
ここでは(({outputMethod=1})) を、
逆に全般的な指定が 1 だったときは、ここでは 0 を指定してみてください。

それでだめなら、(({outputMethod=2})) も試してみてください。
(({outputMethod=2})) でも入力できない場合も、
「詳細なテキストサービスをオフにする」にチェックを入れると、
入力できるようになることがあります
(コントロールパネルの
「地域と言語のオプション」→「言語」タブ→「詳細」→「詳細設定」タブ)。
また、IME との相性もあるようです。


付属の kanchoku.ini に、いくつか設定例がありますので、参考にしてみてください。

==== 表示
表示に関するオプションです。
:(({xLoc=((|n|))}))
:(({yLoc=((|n|))}))
  [kanchoku.ini のデフォルト: -1, -1; 省略時: -1, -1]

  起動時の「漢直Win」のウィンドウの初期位置の x 座標と y 座標を、
  それぞれピクセル単位で指定します。
  -1 とすると、特に指定しない設定になります。
:(({offHide=((|n|))}))
  [kanchoku.ini のデフォルト: 0; 省略時: 0]

  ((|n|)) に 1 を指定すると、OFF 時に「漢直Win」のウィンドウを非表示にします。

  また 2 を指定すると、ON 時にもウィンドウを非表示にします。
  この場合は、補助変換・候補選択・文字ヘルプ・ヒストリ入力・強制練習[^[((<ver1.28|変更履歴>))]^]時のみ、
  ウィンドウを表示します。

:(({followCaret=((|n|))}))
  [kanchoku.ini のデフォルト: 0; 省略時: 0]

  ((|n|)) に 1 を指定すると、
  「漢直Win」のウィンドウがキャレット (カーソル) に
  追従して動くようになります。
  ただし、対象ソフトによっては動作しないことがあります。

:(({displayHelpDelay=((|n|))}))
  [kanchoku.ini のデフォルト: 0; 省略時: 0]

  [^[((<ver1.28|変更履歴>))]^]
  第 1 打鍵が押されてから仮想鍵盤にキー配置が表示されるまでの待ち時間を ((|n|)) に ms 単位で指定します。
  (({offHide=2})) の場合は ((|n|)) に 0 を指定すると無限大の意味になります。
  * ver1.28 では内部タイマーを 100ms 単位としているため、下二桁は無視 (切り上げ) されます。

==== その他
以下は、パッチ作成者の好みで加えられたオプションです。
通常は指定する必要はないでしょう。
:(({hardBS=((|n|))}))
  [kanchoku.ini のデフォルト: 0; 省略時: 0]

  第 2 打鍵として押された ((%BackSpace%)) キーは、通常、
  第 1 打鍵の取り消しですが、
  ((|n|)) に 1 を指定すると、「第 1 打鍵の取り消し + 文字削除」になります。
:(({weakBS=((|n|))}))
  [kanchoku.ini のデフォルト: 0; 省略時: 0]

  [^[((<ver1.28|変更履歴>))]^]
  TUT-Code 等の 3 打鍵以上を用いる入力方式において、
  第 3 打鍵等として押された ((%BackSpace%)) キーは、通常、
  第 1 打鍵以降の取り消しですが、
  ((|n|)) に 1 を指定すると、「直前の打鍵のみの取り消し」になります。
:(({useCtrlKey=((|n|))}))
  [kanchoku.ini のデフォルト: 0; 省略時: 0]

  ((|n|)) に 1 を指定すると、
  「((%Ctrl%))+ 英字」を機能キーと同様に扱います。具体的には、
  * ((%C-g%)) を ((%Esc%)) に
  * ((%C-h%)) を ((%BackSpace%)) に
  * ((%C-m%)) と ((%C-j%)) を ((%Enter%)) に
  * ((%C-i%)) を ((%Tab%)) に
  それぞれ、同様に扱います。

  [^[((<ver1.28|変更履歴>))]^]
  ((|n|)) に 1 を指定した場合は、例として ((%C-h%)) が入力された場合、
  ((%BackSpace%)) と同じ動作をした後アプリに ((%C-h%)) を送出しますが、
  ((|n|)) に 2 を指定すると代わりに ((%BackSpace%)) を送出するようになります。
:(({clearBufOnMove=((|n|))}))
  [kanchoku.ini のデフォルト: 0; 省略時: 0]

  カーソル移動時に後置型変換用の内部バッファを消去するかどうかを指定します。

  後置型で対象の長さを指定しないかたかな変換の際に、
  カーソル移動前に入力した内容まで対象に含まれてしまう問題を
  回避するためのオプションです。

  カーソル移動の検出のため、次の10個のキーをフックします。
  ((%←%))、((%→%))、((%↑%))、((%↓%))、((%PageUp%))、((%PageDown%))、
  ((%Home%))、((%End%))、((%Ctrl%))+((%←%))、((%Ctrl%))+((%→%))
:(({win95=((|n|))}))
  [kanchoku.ini のデフォルト: 0; 省略時: 0]

  Windows95 で仮想鍵盤のフォントが 1 ドットずれるようなので、その補正です。
=end
:(({useTTCode=((|n|))}))
  [kanchoku.ini のデフォルト: 0; 省略時: 0]

  文字ヘルプを、三枚表 T-Code スタイルにします。
  すなわち、
  三枚表 T-Code の右表 (((%j%))((%f%)) をプレフィックスとする 4 ストローク) に
  対しては第 3 打鍵と第 4 打鍵のみを「▲」と「○」で、
  左表 (((%f%))((%j%)) をプレフィックスとする 4 ストローク) に対しては
  第 3 打鍵と第 4 打鍵のみを「▽」と「○」で表示します。

  [^[((<ver1.27e|変更履歴>))]^] このオプションは OBSOLETE になりました。
  かわりに、((<テーブルファイル>)) の
  ((<(({#define prefix ((|spec|))}))>)) を使ってください。
=begin
:(({offResetModes=((|nnn...|))}))
  [kanchoku.ini のデフォルト: 0; 省略時: 0]

  [^[((<ver1.28|変更履歴>))]^]
  ((|nnn...|)) に 1 を指定すると、漢直WinをOFFにしたときに、「かたかなモード」と
  「全角モード」と「句読点」と「強制練習モード」と「ストロークロック」を
  初期状態にリセットします。

  ((|nnn...|)) の各桁は左から順に上記のモードに対応しています。
  110 と指定した場合は 11000 の省略形とみなされ、「かたかなモード」と「全角モード」
  がリセットされます。上記の 1 という指定は 11111 の省略形です。

:(({style_base=((|00rrggbb...|))}))
:(({style_info=((|00rrggbb...|))}))
:(({style_fontname=((|string|))}))
:(({style_fontsize=((|n|))}))
:(({style_padding=((|n|))}))

  [^[((<ver1.28|変更履歴>))]^]
  仮想鍵盤の配色・フォントの設定です。付属のツール kwstyle.exe を用いると、
  実行中の漢直Winでも動的に設定を変更することができます。

  漢直Winと同じディレクトリに置いた kwstyle.exe を起動し、設定を変更して
  ((%OK%)) または ((%Apply%)) をクリックすると、kanchoku.ini が書き換えられ、
  漢直Winが実行中の場合にはその設定が反映されます。


=== キーボードファイル

キーボードファイル *.key は、キーボード上の実際のキーと、
「漢直Win」の内部で使用する ((*キー番号*)) の対応を記述したファイルです。

使用するキーボードに合わせたものを選び、初期設定ファイル kanchoku.ini の
(({keyboard})) オプションで指定します。
「漢直Win」のパッケージに含まれているキーボードファイルは、次のとおりです。

* ((<106.key>)) … 日本語配列 (106 配列、109 配列)
* ((<101.key>)) … 英語配列 (101 配列、104 配列)
* ((<dvorak.key>)) … Dvorak 配列

通常は、上記のいずれかから選ぶとよいでしょう。

特殊なキーボードを使用している方や、キーレイアウトを変更している方は、
以下の ((<キーボードファイルの書式>)) を参考に、
キーボードファイルを記述してお使いください。

==== キーボードファイルの書式

キーボードファイルには、
「漢直Win」で用いる 49 個のキーの ((<仮想キーコード>)) を、16 進表記で、
キー番号 (0 ～ 48) の順に記述します。
各仮想キーコードの後ろには、コンマ ((({,}))) を書きます。
仮想キーコードやコンマの間には、空白や改行を入れてもよいようです。
コメントを書くことはできません。

==== キー番号

キー番号は、「漢直Win」の内部で、各キーを識別するのに用いられる番号です。
T-Code で用いられる 40 個のキーについては、
キーボードの左上から順に 0 ～ 39 を、
またそれ以外のキーにも 40 ～ 48 の番号を割り当てています。

各キー番号のキーの配置を、
実際のキーボード上の配置 (図左)、および
「漢直Win」の仮想鍵盤上の配置 (図右) に示します。
なお、英語キーボードでは、48 番に相当するキーは存在せず、
利用できないようです。

=end
=begin html
<table class="figure" summary="キー番号の対応の図示">
<caption>キー番号の対応――仮想鍵盤 (左) と実際のキーボード (右)</caption>
<tr>
<td>
<img src="img/tkeys_vkb.png" alt="仮想鍵盤" title="仮想鍵盤" />
</td>
<td>
<img src="img/tkeys_kb.png" alt="キーボード" title="キーボード" />
</td>
</tr>
</table>
=end
=begin

==== 仮想キーコード

仮想キーコードは、Windows の内部で、各キーを識別するのに用いられる数値です。

主なキーの仮想キーコードを、下の表に示します。

■((%カナ%))、((%漢字%))、((%Win%)) など、一部のキーは
「漢直Win」では利用できないようです。□
=end


  ━━━━━━━━┯━━━━━━━━┯━━━━━━━━┯━━━━━━━━
  vkey  key       │vkey  key       │vkey  key       │vkey  key
  ────────┼────────┼────────┼────────
   30    0        │ 41    A        │ 4b    K        │ 55    U
   31    1        │ 42    B        │ 4c    L        │ 56    V
   32    2        │ 43    C        │ 4d    M        │ 57    W
   33    3        │ 44    D        │ 4e    N        │ 58    X
   34    4        │ 45    E        │ 4f    O        │ 59    Y
   35    5        │ 46    F        │ 50    P        │ 5a    Z
   36    6        │ 47    G        │ 51    Q        │
   37    7        │ 48    H        │ 52    R        │
   38    8        │ 49    I        │ 53    S        │
   39    9        │ 4a    J        │ 54    T        │
  ────────┼────────┼────────┼────────
   ba   : * (; :) │ c0   @ ` (` ~) │ 08   BS        │ 15   カナ
   bb   ; + (= +) │ db   [ {       │ 09   TAB       │ 19   漢字
   bc   , <       │ dc   \ |       │ 0d   RET       │ 1c   変換
   bd   - = (- _) │ dd   ] }       │ 1b   ESC       │ 1d   無変換
   be   . >       │ de   ^ ~ (' ") │ 20   SPC       │
   bf   / ?       │ e2   \ _ (なし)│                │
  ────────┼────────┼────────┼────────
   21   PageUp    │ 25   ←        │ 2d   Insert    │ 5b   左Win
   22   PageDown  │ 26   ↑        │ 2e   Delete    │ 5c   右Win
   23   End       │ 27   →        │                │ 5d   アプリ
   24   Home      │ 28   ↓        │                │
  ━━━━━━━━┷━━━━━━━━┷━━━━━━━━┷━━━━━━━━
                 vkey: 仮想キーコード; key: 実際のキー; ( ) 内は英語配列



=begin html
<div class="table">
<table class="vkeytbl0" rules="cols" summary="仮想キーコードと実際のキーの対応">
<caption>仮想キーコード (vkey) と実際のキー (key) の対応 (かっこ内は英語配列)</caption>
<tr valign="top">
<td>
<table class="vkeytbl" summary="仮想キーコードと実際のキーの対応">
<colgroup><col align="right" /><col align="left" /></colgroup>
<thead><tr><th>vkey</th><th>key</th></tr></thead>
<tbody>
<tr><td><code>30</code></td><td><kbd>0</kbd></td></tr>
<tr><td><code>31</code></td><td><kbd>1</kbd></td></tr>
<tr><td><code>32</code></td><td><kbd>2</kbd></td></tr>
<tr><td><code>33</code></td><td><kbd>3</kbd></td></tr>
<tr><td><code>34</code></td><td><kbd>4</kbd></td></tr>
<tr><td><code>35</code></td><td><kbd>5</kbd></td></tr>
<tr><td><code>36</code></td><td><kbd>6</kbd></td></tr>
<tr><td><code>37</code></td><td><kbd>7</kbd></td></tr>
<tr><td><code>38</code></td><td><kbd>8</kbd></td></tr>
<tr><td><code>39</code></td><td><kbd>9</kbd></td></tr>
</tbody>
</table>
</td>
<td>
<table class="vkeytbl" summary="仮想キーコードと実際のキーの対応">
<colgroup><col align="right" /><col align="left" /></colgroup>
<thead><tr><th>vkey</th><th>key</th></tr></thead>
<tbody>
<tr><td><code>41</code></td><td><kbd>A</kbd></td></tr>
<tr><td><code>42</code></td><td><kbd>B</kbd></td></tr>
<tr><td><code>43</code></td><td><kbd>C</kbd></td></tr>
<tr><td><code>44</code></td><td><kbd>D</kbd></td></tr>
<tr><td><code>45</code></td><td><kbd>E</kbd></td></tr>
<tr><td><code>46</code></td><td><kbd>F</kbd></td></tr>
<tr><td><code>47</code></td><td><kbd>G</kbd></td></tr>
<tr><td><code>48</code></td><td><kbd>H</kbd></td></tr>
<tr><td><code>49</code></td><td><kbd>I</kbd></td></tr>
<tr><td><code>4a</code></td><td><kbd>J</kbd></td></tr>
<tr><td><code>4b</code></td><td><kbd>K</kbd></td></tr>
<tr><td><code>4c</code></td><td><kbd>L</kbd></td></tr>
<tr><td><code>4d</code></td><td><kbd>M</kbd></td></tr>
</tbody>
</table>
</td>
<td>
<table class="vkeytbl" summary="仮想キーコードと実際のキーの対応">
<colgroup><col align="right" /><col align="left" /></colgroup>
<thead><tr><th>vkey</th><th>key</th></tr></thead>
<tbody>
<tr><td><code>4e</code></td><td><kbd>N</kbd></td></tr>
<tr><td><code>4f</code></td><td><kbd>O</kbd></td></tr>
<tr><td><code>50</code></td><td><kbd>P</kbd></td></tr>
<tr><td><code>51</code></td><td><kbd>Q</kbd></td></tr>
<tr><td><code>52</code></td><td><kbd>R</kbd></td></tr>
<tr><td><code>53</code></td><td><kbd>S</kbd></td></tr>
<tr><td><code>54</code></td><td><kbd>T</kbd></td></tr>
<tr><td><code>55</code></td><td><kbd>U</kbd></td></tr>
<tr><td><code>56</code></td><td><kbd>V</kbd></td></tr>
<tr><td><code>57</code></td><td><kbd>W</kbd></td></tr>
<tr><td><code>58</code></td><td><kbd>X</kbd></td></tr>
<tr><td><code>59</code></td><td><kbd>Y</kbd></td></tr>
<tr><td><code>5a</code></td><td><kbd>Z</kbd></td></tr>
</tbody>
</table>
</td>
<td>
<table class="vkeytbl" summary="仮想キーコードと実際のキーの対応">
<colgroup><col align="right" /><col align="left" /></colgroup>
<thead><tr><th>vkey</th><th>key</th></tr></thead>
<tbody>
<tr><td><code>ba</code></td><td><kbd>:*</kbd> (<kbd>;:</kbd>)</td></tr>
<tr><td><code>bb</code></td><td><kbd>;+</kbd> (<kbd>=+</kbd>)</td></tr>
<tr><td><code>bc</code></td><td><kbd>,&lt;</kbd></td></tr>
<tr><td><code>bd</code></td><td><kbd>-=</kbd> (<kbd>-_</kbd>)</td></tr>
<tr><td><code>be</code></td><td><kbd>.&gt;</kbd></td></tr>
<tr><td><code>bf</code></td><td><kbd>/?</kbd></td></tr>
<tr><td><code>c0</code></td><td><kbd>@`</kbd> (<kbd>`~</kbd>)</td></tr>
<tr><td><code>db</code></td><td><kbd>[{</kbd></td></tr>
<tr><td><code>dc</code></td><td><kbd>\|</kbd></td></tr>
<tr><td><code>dd</code></td><td><kbd>]}</kbd></td></tr>
<tr><td><code>de</code></td><td><kbd>^~</kbd> (<kbd>'&quot;</kbd>)</td></tr>
<tr><td><code>e2</code></td><td><kbd>\_</kbd> (なし)</td></tr>
</tbody>
</table>
</td>
<td>
<table class="vkeytbl" summary="仮想キーコードと実際のキーの対応">
<colgroup><col align="right" /><col align="left" /></colgroup>
<thead><tr><th>vkey</th><th>key</th></tr></thead>
<tbody>
<tr><td><code>08</code></td><td><kbd>BS</kbd></td></tr>
<tr><td><code>09</code></td><td><kbd>TAB</kbd></td></tr>
<tr><td><code>0d</code></td><td><kbd>Enter</kbd></td></tr>
<tr><td><code>15</code></td><td><kbd>カナ</kbd></td></tr>
<tr><td><code>19</code></td><td><kbd>漢字</kbd></td></tr>
<tr><td><code>1b</code></td><td><kbd>ESC</kbd></td></tr>
<tr><td><code>1c</code></td><td><kbd>変換</kbd></td></tr>
<tr><td><code>1d</code></td><td><kbd>無変換</kbd></td></tr>
<tr><td><code>20</code></td><td><kbd>SPC</kbd></td></tr>
</tbody>
</table>
</td>
<td>
<table class="vkeytbl" summary="仮想キーコードと実際のキーの対応">
<colgroup><col align="right" /><col align="left" /></colgroup>
<thead><tr><th>vkey</th><th>key</th></tr></thead>
<tbody>
<tr><td><code>21</code></td><td><kbd>PageUp</kbd></td></tr>
<tr><td><code>22</code></td><td><kbd>PageDown</kbd></td></tr>
<tr><td><code>23</code></td><td><kbd>End</kbd></td></tr>
<tr><td><code>24</code></td><td><kbd>Home</kbd></td></tr>
<tr><td><code>25</code></td><td><kbd>←</kbd></td></tr>
<tr><td><code>26</code></td><td><kbd>↑</kbd></td></tr>
<tr><td><code>27</code></td><td><kbd>→</kbd></td></tr>
<tr><td><code>28</code></td><td><kbd>↓</kbd></td></tr>
<tr><td><code>2d</code></td><td><kbd>Insert</kbd></td></tr>
<tr><td><code>2e</code></td><td><kbd>Delete</kbd></td></tr>
<tr><td><code>5b</code></td><td>左<kbd>Win</kbd></td></tr>
<tr><td><code>5c</code></td><td>右<kbd>Win</kbd></td></tr>
<tr><td><code>5d</code></td><td><kbd>Appl</kbd></td></tr>
</tbody>
</table>
</td>
</tr>
</table>
</div>
=end
=begin

==== 付属のキーボードファイル

+ 106.key

  31, 32, 33, 34, 35, 36, 37, 38, 39, 30,
  51, 57, 45, 52, 54, 59, 55, 49, 4f, 50,
  41, 53, 44, 46, 47, 48, 4a, 4b, 4c, bb,
  5a, 58, 43, 56, 42, 4e, 4d, bc, be, bf,
  20, bd, de, dc, c0, db, ba, dd, e2,
=end
=begin html
<table class="figure" summary="106.key の対応の図示">
<tr>
<td>
<img src="img/keys_106_vkb.png" alt="仮想鍵盤" title="仮想鍵盤" />
</td>
<td>
<img src="img/keys_106_kb.png" alt="キーボード" title="キーボード" />
</td>
</tr>
</table>
=end
=begin
+ 101.key

  31, 32, 33, 34, 35, 36, 37, 38, 39, 30,
  51, 57, 45, 52, 54, 59, 55, 49, 4f, 50,
  41, 53, 44, 46, 47, 48, 4a, 4b, 4c, ba,
  5a, 58, 43, 56, 42, 4e, 4d, bc, be, bf,
  20, bd, bb, dc, db, dd, de, c0, 00,
=end
=begin html
<table class="figure" summary="101.key の対応の図示">
<tr>
<td>
<img src="img/keys_101_vkb.png" alt="仮想鍵盤" title="仮想鍵盤" />
</td>
<td>
<img src="img/keys_101_kb.png" alt="キーボード" title="キーボード" />
</td>
</tr>
</table>
=end html
=begin

+ dvorak.key

  31, 32, 33, 34, 35, 36, 37, 38, 39, 30,
  de, bc, be, 50, 59, 46, 47, 43, 52, 4c,
  41, 4f, 45, 55, 49, 44, 48, 54, 4e, 53,
  ba, 51, 4a, 4b, 58, 42, 4d, 57, 56, 5a,
  20, db, dd, dc, bf, bb, bd, c0, e2,
=end

<table class="figure" summary="dvorak.key の対応の図示">
<tr>
<td>
<img src="img/keys_dvorakj_vkb.png" alt="仮想鍵盤" title="仮想鍵盤" />
</td>
<td>
<img src="img/keys_dvorakj_kb.png" alt="キーボード" title="キーボード" />
</td>
</tr>
</table>

=begin html
<table class="figure" summary="dvorak.key の対応の図示">
<tr>
<td>
<img src="img/keys_dvorake_vkb.png" alt="仮想鍵盤" title="仮想鍵盤" />
</td>
<td>
<img src="img/keys_dvorake_kb.png" alt="キーボード" title="キーボード" />
</td>
</tr>
</table>
=end
=begin




=== テーブルファイル

テーブルファイルは、入力方式 (T-Code や TUT-Code など) の定義
を記述したファイルです。

使用する入力方式に合わせたものを選び、初期設定ファイル kanchoku.ini の
(({tableFile})) オプションで指定します。
「漢直Win」のパッケージに含まれているテーブルファイルは、次のとおりです。

* t.tbl … T-Code
* tut.tbl … TUT-Code
* g.tbl … G-Code

テーブルファイルをカスタマイズしたい方や、独自の入力方式をお使いの方は、
以下の ((<テーブルファイルの書式>)) を参考に、
テーブルファイルを記述してお使いください。

==== テーブルファイルの書式

以下に、テーブルファイルの書式 (推測) を説明します。

テーブルファイルは、大まかに以下のような形をしています。

  {
     <0> ,  <1> ,  <2> ,  <3> ,  <4> ,  <5> ,  <6> ,  <7> ,  <8> ,  <9> ,
    <10> , <11> , <12> , <13> , <14> , <15> , <16> , <17> , <18> , <19> ,
    <20> , <21> , <22> , <23> , <24> , <25> , <26> , <27> , <28> , <29> ,
    <30> , <31> , <32> , <33> , <34> , <35> , <36> , <37> , <38> , <39> ,
    <40> , <41> , <42> , <43> , <44> , <45> , <46> , <47> , <48>
  }

すなわち、(({<0>})) ～ (({<48>})) の 49 個の「なんらかの要素」を、
コンマ ((({,}))) で区切って並べ、
その全体を中かっこ ((({{})) と (({(('}'))}))) で囲ったものです。
これを、以後、ブロックと呼びます。

* 「なんらかの要素」は、一般に、別のブロックまたは特殊定義です。
* 最も外側のブロックのことを、((*モードブロック*)) と呼びます。
* [^[((<ver1.28|変更履歴>))]^]((*モードブロック*)) は、複数回繰り返すことができ、
  拡張部分や機能キー定義を分離して記述することができます。
* 各要素とコンマ、中かっこの間には、空白や改行を入れてもよいようです。
* (({;})) または (({#})) から行末までは、コメントとして読みとばされます。

ブロックの中の各要素 (({<n>})) が、
それぞれの ((<キー番号>)) のキーに対応しており、
この部分に、各キーの挙動を記述します。

[^[((<ver1.28|変更履歴>))]^]
シフト打鍵を用いる入力方式の場合、各要素は
実際には (～(({,}))(({<n> / <Sn>}))(({,}))～) という形式で
2個の要素を指定するようになっており、(({<n>})) で通常打鍵時の、(({<Sn>})) で
シフト打鍵時の挙動を記述します。(({/})) 以降を省略することができ、省略した
形式のものが従来のテーブルファイルと同じになります。
なお、シフト打鍵を使わないキーのシフト打鍵は漢直Winの制御下にないため、
従来のテーブルファイルを用いれば自動的に従来と同じ動作になります。

各キーの挙動として指定する要素は、次のいずれかです。

:空定義
  何も書かなかった場合は、空定義となります。

  この場合、該当キーを押しても何も起こらず、何も入力されません
  (厳密には、内部状態がリセットされ、第 1 打鍵待ちの状態になります)。
  文字が定義されていないキーには、空定義を指定します。

  なお、空定義を指定する場合でも、区切りのコンマは省略できません。

  [^[((<ver1.28|変更履歴>))]^]モードブロックを複数回繰り返す場合、
  そのブロックで定義または上書きしたい部分以外は空定義にしてください。

:ブロック
  49 個の要素をコンマ ((({,}))) で区切って並べ、
  全体を中かっこ ((({{})) と (({(('}'))}))) で囲ったものです。

  次の打鍵に続くようなキーにはブロックを指定し、
  そのブロックの内側の各要素に、次の各打鍵の挙動を記述します。

:文字列
  (({"の"})) あるいは (({"漢"})) などのように、
  ダブルクォート ((({"}))) で囲った
  文字 (の有限個の並び) です。
  この場合、該当するキーを打鍵すると、指定した文字が入力されます。

  なお、文字列定義中の「(({\}))」は、続く 1 文字をエスケープします。
  文字「"」を定義するには「(({"\""}))」、
  「\」を定義するには「(({"\\"}))」と指定してください。

  現在の仕様では、
  「(({\}))」は単なるエスケープであり、「(({\n}))」や「(({\t}))」は
  改行やタブにはなりません。

:特殊定義
  部首合成変換や交ぜ書き変換など、
  各種の機能に対応する定義です。
  (({@b})) や (({@m})) などのように、(({@<文字>})) という形式をしています。

  後述の ((<特殊定義の一覧>)) を参照してください。

:矢印定義
  [^[((<ver1.28|変更履歴>))]^] (({"-26>"})) や (({"-S12>"})) などのように、マイナス ((({-}))) と
  不等号 ((({>}))) でキー番号を囲ったものです。矢印定義の後ろに、キー番号で
  指定した打鍵の挙動を指定します。モードブロックとしても利用可能です。

  シフト打鍵は (({"S12"})) のように (({"S"})) をつけて指定します。

たとえば T-Code の場合では、
モードブロックの 0 ～ 39 番の要素 (第 1 打鍵に対応) にブロックを指定し、
その各ブロックの中の 0 ～ 39 番の要素 (第 2 打鍵に対応) に文字列を
指定することになります。
特に、
モードブロックの中の 26 番のブロックの中の 23 番の要素には
部首合成変換 (({@b})) を、
また 23 番のブロックの中の 26 番の要素には
交ぜ書き変換 (({@m})) を指定することに
なります。

TUT-Code も T-Code の場合と同様ですが、
3 ストロークや 4 ストロークの文字に対しては、
モードブロック内の該当する要素に、2 重あるいは 3 重の入れ子のブロックを
指定することになるでしょう。

[^[((<ver1.28|変更履歴>))]^]
矢印定義を用いれば、ブロックが入れ子になること等を避けることができ、
読みやすく改造しやすいテーブルファイルを記述することが可能になります。

たとえば先ほどの T-Code の例は、矢印定義を用いれば、独立したモードブロックとして

  -23>-26>@m
  -26>-23>@b

の2行で記述できます。

==== 特殊定義の一覧

特殊定義に指定できるものを、以下に列挙します。
[ ] 内は仮想鍵盤での表示を、
( ) 内は「漢直Win」の内部での名前を表しています。

+ モード類の特殊定義
:(({@Z})) [((%全%))] (((|F_HANZEN|)))
  ((<全角モード>)) の切り替えです。
  全角モードでは、
  テーブルで定義された文字のうち、
  半角文字 (ASCII 文字) と対応する全角文字が相互変換されて入力されます。
  [:del:]なお、半角かなには対応していません。[:/del:]
  ((<初期設定ファイル>)) で (({enableHankakuKana=1})) オプションを指定すると、
  半角かなにも対応します。[^[((<ver1.27f|変更履歴>))]^]
:(({@K})) [((%ア%))] (((|F_HIRAKATA|)))
  ((<かたかなモード>)) の切り替えです。
  かたかなモードでは、
  テーブルで定義された文字のうち、
  ひらがなとかたかなが相互変換されて入力されます。
:(({@s})) [((%替%))] (((|F_SWITCH_MODE|)))
  (({@K})) と同じ意味になります。
:(({@p})) [((%句%))] (((|F_PUNCT|)))
  ((<句読点の切り替え>)) です。
  テーブルで定義された文字のうち、「、。」と「，．」が
  相互変換されて入力されます。
:(({@g})) [((%習%))] (((|F_MAZE2GG|)))
  [^[((<ver1.28|変更履歴>))]^] ((<強制練習モード>)) の切り替えです。
  交ぜ書き変換において、候補の一覧から選択する標準モードとガイド表示に従って
  直接入力する強制練習モードを切り替えます。
:(({@w})) [((%窓%))] (((|F_SHOWWIN|)))
  [^[((<ver1.28|変更履歴>))]^] (({offHide=1})) と (({offHide=2})) の間でトグルします。

+ 前置型の変換の特殊定義
:(({@b})) [((%◆%))] (((|F_BUSHU_PRE|)))
  前置型の ((<部首合成変換>)) を開始します。
:(({@m})) [((%◇%))] (((|F_MAZE_PRE|)))
  前置型の ((<交ぜ書き変換>)) を開始します。
:(({@!})) [((%◎%))] (((|F_HIST|)))
  ((<ヒストリ入力>)) モードに入ります。

+ 取消の特殊定義
:(({@q})) [((%×%))] (((|F_QUIT|)))
  部首合成変換モードや交ぜ書き変換モードを中断し、
  通常の入力モードに戻ります

+ 後置型の変換の特殊定義
:(({@B})) [((%部%))] (((|F_BUSHU_POST|)))
  ((<後置型の部首合成変換>)) です。
:(({@1})) ～ (({@9})) [((%変%))] (((|F_MAZE_POST1|)) ～ ((|F_MAZE_POST9|)))
  それぞれ、読みの長さが 1 文字 ～ 9 文字の ((<後置型の交ぜ書き変換>)) です。
:(({@-})) [((%カ%))] (((|F_KATA_POST0|)))
  連続するひらがなや「ー」を対象とする ((<後置型のかたかな変換>)) です。
:(({@Q})) ～ (({@Y})) [((%カ%))] (((|F_KATA_POST1|)) ～ ((|F_KATA_POST9|)))
  それぞれ、対象の長さが 1 文字 ～ 9 文字の ((<後置型のかたかな変換>)) です。
:(({@)})) (({@(})) (({@'})) (({@&})) (({@%})) (({@$})) [((%ヵ%))] (((|F_KATA_POSTH1|)) ～ ((|F_KATA_POSTH6|)))
  連続するひらがなや「ー」を対象とする ((<後置型のかたかな変換>)) において、
  変換から除外する文字の長さをそれぞれ、1 文字 ～ 6 文字と指定して変換します。
:(({@@})) (({@[})) (({@;})) (({@:})) (({@]})) [((%か%))] (((|F_KATA_POSTS1|)) ～ ((|F_KATA_POSTS5|)))
  直前の ((<後置型のかたかな変換>)) で変換したかたかな文字列を、
  それぞれ 1 文字 ～ 5 文字縮めます。
:(({@D})) [((%゛%))] (((|F_DAKUTEN|)))
  後置型の濁点です。
:(({@P})) [((%゜%))] (((|F_HANDAKUTEN|)))
  後置型の半濁点です。

+ 文字ヘルプの特殊定義
:(({@h})) [((%≪%))] (((|F_HELP_BACKW|)))
  直前の ((<文字ヘルプ>)) を再表示します。
  続けて実行すると、ヘルプ履歴をさかのぼって表示します。
:(({@H})) [((%≫%))] (((|F_HELP_FORW|)))
  直前の ((<文字ヘルプ>)) を再表示します。
  続けて実行すると、(({@h})) の逆方向に表示します。

+ キー入力の特殊定義
:(({@v})) [((%・%))] (((|F_VERB_FIRST|)))
  最初のストロークのキーを入力します。
  T-Code の第 2 打鍵の ((%Space%)) に指定するとよいでしょう。
  なお、第 1 打鍵として指定された場合は、その打鍵そのものを入力します。
:(({@^})) [((%・%))] (((|F_VERB_THIS|)))
  [^[((<ver1.28|変更履歴>))]^] 今入力したストロークのキーを入力します。



==== 入力方式に固有の設定

[^[((<ver1.27e|変更履歴>))]^]
「(({#define ((|...|))}))」の形式の行指定で、
入力方式に固有の設定を行うことができます。
現在、以下のオプションが設定可能です。

:(({#define table-name "((|name|))"}))
  入力方式の名前を、
  (({"T"})), (({"TUT"})), (({"G"}))などのように指定します。
  指定した名前は、「漢直Win」のタイトルバーに表示されます。

:(({#define prefix ((|spec|))}))
  Try-Code や TT-Code などの、プレフィックス拡張型の入力方式における、
  文字ヘルプの表示指定です。
  * Try-Code の場合
      #define prefix /■/40/■□/回/
  * TT-Code の場合
      #define prefix /▲/26,23/▲○/▲/:/▽/23,26/▽○/▽/
  「拡張表を代表する文字 (漢索窓で利用される)」
  「拡張プレフィックスのキー番号 (コンマ区切り)」
  「((*base stroke*))
  (拡張プレフィックスを除いた部分の各打鍵) を表す文字 (初打から順に並べる)」
  「base stroke での二重打鍵と (もしあれば) 三重打鍵を表す文字 (並べる)」
  を、スラッシュで区切って指定します。
  指定が複数ある場合は、コロンで区切って並べます。

  [^[((<ver1.28|変更履歴>))]^]シフト打鍵は (({"S12"})) のように (({"S"})) をつけて指定します。


:(({#define defguide "((|string|))"}))
  ((<初期設定ファイル>)) の ((<(({defg=((|string|))}))>)) と同様です。
  たとえば、phoenix 配列の((*配字案内*))は次のように指定します。
    #define defguide "亜域液牡凱梶丸偽漁吟芸元鯉剛坐雑事蛇什傷上笥税糎促濁中鍔努峠寧函備侮別頬脈唯乱令"
  (({defg=((|string|))})) と同時に指定された場合は、
  (({defg=((|string|))})) の設定が優先されます。


=end
