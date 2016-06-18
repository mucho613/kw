=begin

== 補助機能

直接入力できない文字 (コードが割り当てられていない文字) は、
「((*外字*))」と呼ばれます。
「漢直Win」では、外字を入力するための補助入力手段として、
T-Code でよく使われている、
((<部首合成変換>))と((<交ぜ書き変換>))の機能を提供しています。
補助入力は、
打ち方の分からない文字を入力するのにも利用することができます。



=== 部首合成変換

部首合成変換とは、2 つの文字を組み合わせて 1 文字を入力する方法です。
たとえば、「日 + 生」→「星」のように入力を行います。
「字形組み合わせ入力」とも呼ばれます。

部首合成変換を活用するには、
組み合わせの部品となる漢字を、ある程度覚えておく必要があります。
しかし、文字の意味や読みを考えずに入力することができ、
また、候補選択の必要もないという特徴があります。

「漢直Win」での部首合成変換の手順は、次のとおりです。
(1) 仮想鍵盤上の「((%◆%))」のキーを打鍵します。
    「((%◆%))」は、T-Code では ((%j%))((%f%)), 
    TUT-Code では ((%a%))((%l%))((%a%)) に割り当てられています。
(2) すると、((*部首合成変換モード*)) に入り、
    ミニバッファに部首合成変換の開始を示す「◆」が表示されます。
(3) 続けて、組み合わせる 2 文字を順に入力します。
    入力した文字は、いったんミニバッファに保持され、
    合成が行われた時点で対象ソフトに送られます
    (2 文字目が入力された瞬間に変換が行われるので、
    2 文字目はミニバッファに表示されません)。

=end
=begin html
<table class="figure" summary="部首合成変換の図示">
<caption>部首合成変換</caption>
<tr>
<td>
<img src="img/bushu.png" alt="部首合成変換" title="部首合成変換" />
</td>
</tr>
</table>
=end
=begin
* 入力された文字が合成できないときは、2 文字目の入力は捨てられ、
  引き続き 2 文字目の入力待ちの状態になります。
* 変換アルゴリズムの違いなどによって、
  他の T-Code ドライバ (特に ((<tc2|"直接入力ソフト">))) と
  同じ変換結果にならないことがあります。
  ((<補助入力>)) の (({bushuAlgo})) の解説も参照してください。
* 部首合成変換モードでのキー操作は、次のとおりです。
  * ((%BackSpace%)) … 入力した文字を消去
  * ((%Esc%)) … 部首合成変換を中断する
* 部首合成した結果が、直接入力できる文字である (外字でない) ときは、
  その文字のコードを表す打鍵図が仮想鍵盤に表示されます (((<文字ヘルプ>)))。
* 部首合成した結果が外字であるときは、((<ヒストリ入力>)) の対象になります。

=end
<table class="figure" summary="文字ヘルプの図示">
<caption>文字ヘルプ</caption>
<tr>
<td>
<img src="img/bushu_help.png" alt="文字ヘルプ" title="文字ヘルプ" />
</td>
</tr>
</table>
=begin

==== 部首を代表する文字

部首合成変換では、部品としてよく使われる文字を覚えておくと便利です。
以下に、部首を代表する文字を挙げておきます
(((<tc2|"直接入力ソフト">)) の info より引用)。
  ア、院→こざとへん　　イ→にんべん　　　　　ウ→うかんむり
  エ→工　　　　　　　　オ→てへん　　　　　　サ→くさがんむり
  シ→さんずい　　　　　ヌ→又　　　　　　　　ネ→しめすへん
  リ→りっとう　　　　　レ→礼のつくり　　　　ロ→口(くち)
  ワ→わかんむり　　　　ン→にすい　　　　　　部→おおざと
  性→りっしんべん　　　独→けものへん　　　　四→あみがしら
  図→くにがまえ　　　　之→しんにょう

==== 部首合成変換の例

部首合成変換の例を、いくつか挙げておきましょう。

文字の足し算
  「◆木木」→「林」　　「◆木甘」→「柑」
  「◆金建」→「鍵」　　「◆甘木」→「某」
文字の引き算
  「◆終糸」→「冬」　　「◆遺之」→「貴」
  「◆買四」→「貝」　　「◆優イ」→「憂」
文字の一部分の合成
  「◆黒然」→「黙」　　「◆監見」→「覧」
  「◆避土」→「壁」　　「◆四掛」→「罫」
意味や読み
  「◆しめ」→「〆」　　「◆木3」→「森」
  「◆郵便」→「〒」　　「◆黒四」→「◆」
再帰的な合成
  「◆◆上七ル」→「◆虍ル」→「虎」
  「◆四◆土土ト」→「◆四◆圭ト」→「◆四卦」→「罫」

個々の文字の具体的な合成のしかたについては、
部首合成変換辞書 kwbushu.rev を参照してください。

==== 部首合成変換辞書

+ 付属の部首合成辞書

付属の部首合成変換辞書 kwbushu.rev は、
((<tc2|"直接入力ソフト">)) (バージョン 2.3.1) のパッケージに含まれている 
bushu.rev に、以下の変更を行ったものです。
* symbol.rev (記号類の定義) をマージ
* 全角モードでの変換のために、「(({3３}))」のような半角/全角の等価定義を追加
* コード変換 (Shift-JIS, CR/LF)

+ 部首合成辞書の書式

部首合成変換辞書の書式は、
以下のいずれかの定義を 1 行に 1 つずつ書いたものです。
* 「(({CAB}))」の形の定義 … 
  「C ::= A + B」(A と B を組み合わせると C になる) の意味。
  たとえば、次は、「日 + 音 → 暗」という定義を表します。
    暗日音
* 「(({CA}))」の形の定義 … 
  「A ≡ C」(A は C のかわりになる) の意味。
  たとえば、次は、
  「院」(部首合成ではこざとへんを表す文字) を使うべきところで、
  「ア」をかわりに使ってもよいことを表します。
    院ア

部首合成辞書を書き換える場合は、
重複する定義を避け、またソートしておくようにしましょう。
「漢直Win」の現在の仕様では、ソートされていなくてもかまいませんが、
他のドライバと辞書を共用する場合に、問題になることがあります。



=== 交ぜ書き変換

交ぜ書き変換とは、一般のかな漢字変換と同様に、
漢字の読みを入力して変換する方法ですが、
読みに漢字を含めることができるのが特徴です。
このことにより、すでに覚えた漢字を活用して候補を絞りこむことができます。

たとえば、「記者」と入力したい場合、
「記しゃ」「き者」などの“読み”で変換することができます。
この場合、「貴社」「汽車」「帰社」などの候補は現れないので、
誤変換を避けることができます。

ただし、「漢直Win」の交ぜ書き変換では、次のような制限があります。
* 単語変換 (単文節変換) である
* [:del:]読みに活用語尾を含めることができない[:/del:]
* 変換結果を学習しない
* 辞書に対して登録や削除ができない

「漢直Win」での交ぜ書き変換の手順は、次のとおりです。
(1) 仮想鍵盤上の「((%◇%))」のキーを入力します。
    「((%◇%))」は、T-Code では ((%f%))((%j%)),
    TUT-Code では ((%a%))((%l%))((%j%)) に割り当てられています。
(2) すると、((*交ぜ書き変換モード*)) に入り、
    ミニバッファに、交ぜ書き変換の開始を示す「◇」が表示されます。
(3) 続けて読みを入力します (図左)。
(4) ((%Space%)) を押すと、変換が実行され、((*候補選択モード*)) に入ります。
    変換変補が仮想鍵盤に表示されますので (図右)、
    対応するキーを押して、選択します。
=end
=begin html
<table class="figure" summary="交ぜ書き変換の図示">
<caption>交ぜ書き変換――読みの入力 (左) と候補の選択 (右)</caption>
<tr>
<td>
<img src="img/maze_yomi_kisha.png" alt="交ぜ書き・「き社」の読み" title="交ぜ書き・「き社」の読み" />
</td>
<td>
<img src="img/maze_cand_kisha.png" alt="交ぜ書き・「き社」の候補" title="交ぜ書き・「き社」の候補" />
</td>
</tr>
</table>
=end
=begin

* 旧字や異体字への変換、再帰的な変換もできます。
  * 「((%◇%))学」→「學」
  * 「((%◇%))((%◇%))まん」→「((%◇%))万」→「萬」
* [:del:]活用する語 (形容詞、動詞、形容動詞など) は、
  語尾を取り除いて、変化しない部分 (語幹) を読みとして入力します
  (「送りがなを除いた部分」ではありません)。[:/del:]

  [:del:]たとえば、「楽しい」は「たのし」で、「走る」は「はし」の読みで
  変換してください。
  [:/del:]

* 活用語を変換するときは、((%<%)) で語幹を伸ばし、
  ((%>%)) で縮めます[^[((<ver1.27f|変更履歴>))]^]。

* 候補選択モードの表示は、実際には変換候補の個数によって変わります。
  * [:del:]変換候補が 1 つのときは、(候補選択モードにならずに) すぐに
    対象ソフトに入力されます。[:/del:]
  * 変換候補が 1 つのときは、確定動作なしに続きの入力ができます。[^[((<ver1.27f|変更履歴>))]^]
  * 変換候補が 10 以下のときは、縦長の枠に候補が列挙されます (下図左)。
    対応する列のキー (ホームポジションの段の) で選択します。
  * 変換候補が 10 を超えるときは、通常の仮想鍵盤の 30 キーに
    候補が表示されます (下図右)。
* 交ぜ書き変換した結果が、直接入力できる文字である (外字でない) ときは、
  その文字のコードを表す打鍵図が仮想鍵盤に表示されます (((<文字ヘルプ>)))。
* 交ぜ書き変換した結果が外字であるときは、
  ((<ヒストリ入力>)) の対象になります。

* 交ぜ書き変換モードでのキー操作は、次のとおりです。
  * ((%Space%)) … 変換を実行する (候補選択モードに入る)
  * ((%BackSpace%)) … 読みを 1 文字消去する
  * ((%Esc%)) … 交ぜ書き変換を中断する
  * ((%Enter%)) … 読みを無変換のまま確定し、対象ソフトに入力する
  * ((%Tab%)) … 読みをひらがな/かたかな変換し、対象ソフトに入力する

* 候補選択モードでのキー操作は、次のとおりです。
  * ((%Space%)) … 次の候補群へ進む
  * ((%BackSpace%)) … 前の候補群へ戻る。
    最初まで戻ったら、読み入力状態 (交ぜ書き変換モード) に戻る
  * ((%Esc%)) … 読み入力状態に戻る
  * ((%Enter%)) … 読みを無変換のまま確定し、対象ソフトに入力する
  * ((%Tab%)) … 読みをひらがな/かたかな変換し、対象ソフトに入力する
  * ((%<%)) … 語幹を伸ばす[^[((<ver1.27f|変更履歴>))]^]
  * ((%>%)) … 語幹を縮める[^[((<ver1.27f|変更履歴>))]^]

* 変換候補が 1 つの場合でのキー操作は、次のとおりです。[^[((<ver1.27f|変更履歴>))]^]
  * ((%BackSpace%)) … 読み入力状態 (交ぜ書き変換モード) に戻る
  * ((%Esc%)) … 読み入力状態に戻る
  * ((%Enter%)) … 候補を確定し、対象ソフトに入力する
  * ((%Tab%)) … 読みをひらがな/かたかな変換し、対象ソフトに入力する
  * ((%<%)) … 語幹を伸ばす
  * ((%>%)) … 語幹を縮める
  * その他 … 候補を確定し、対象ソフトに入力し、続けてそのストロークが第一打鍵となる

=end
=begin html
<table class="figure" summary="候補選択モードの図示">
<caption>候補選択モード・候補数が少ない場合 (左) と多い場合 (右)</caption>
<tr>
<td>
<img src="img/maze_cand_awa.png" alt="交ぜ書き・「あわ」の候補選択" title="交ぜ書き・「あわ」の候補選択" />
</td>
<td>
<img src="img/maze_cand_kou.png" alt="交ぜ書き・「こう」の候補選択" title="交ぜ書き・「こう」の候補選択" />
</td>
</tr>
</table>
=end
=begin

==== 強制練習モード

強制練習モード[^[((<ver1.28|変更履歴>))]^] は、交ぜ書き変換により得られた候補を
((<熟語ガイド>)) と同様のガイド表示に従って絞り込みながら直接入力してゆく方法です。

「漢直Win」のデフォルトの設定では、強制練習モードは無効になっています。
強制練習モードを使用するには、((<初期設定ファイル>)) kanchoku.ini の
(({((*;*))maze2gg=1}))
と書いてある行を
(({maze2gg=1}))
のように変更してください。
あるいは、((<テーブルファイル>)) の特殊定義(({@g})) を用いることで、標準モードと
強制練習モードを切り替えることができます。

=end
=begin html
<table class="figure" summary="強制練習モードの図示">
<caption>強制練習モード・変換直後の状態</caption>
<tr>
<td>
<img src="img/maze2gg_kansya.png" alt="交ぜ書き・「かんしゃ」の候補選択" title="交ぜ書き・「かんしゃ」の候補選択" />
</td>
<td>
<img src="img/maze2gg_ippou.png" alt="交ぜ書き・「いっぽう」の候補選択" title="交ぜ書き・「いっぽう」の候補選択" />
</td>
</tr>
</table>
=end
=begin

* 読みの先頭が直接入力できている場合 (練習不要) や、変換結果の文字が一意でありかつ外字の場合
  (練習不可能) などでは、そこまで入力済みとなりその次の文字からの練習動作になります。
* 次に入力する文字が一意の場合、ガイドに加えて打鍵方法が
  ((<文字ヘルプ>)) と同様の彩色で示されます。また、前置型変換モードの中でない場合は
  ((%Tab%)) を押すと補完動作となり、選択肢が分かれる直前までの分が入力されます。
  * (({conjugationalMaze=2})) では変換直後は語幹操作モードになるため、入力を開始するか
    ((%Enter%)) を押さないと ((%Tab%))  はひらがな/かたかな変換の動作になります。

* 語幹操作モードでのキー操作は、次のとおりです。
  * ((%BackSpace%)) … 読み入力状態 (交ぜ書き変換モード) に戻る
  * ((%Esc%)) … 読み入力状態に戻る
  * ((%Enter%)) … 語幹の長さを確定し、練習入力状態に進む
  * ((%Tab%)) … 読みをひらがな/かたかな変換し、対象ソフトに入力する
  * ((%<%)) … 語幹を伸ばす
  * ((%>%)) … 語幹を縮める
  * その他 … 練習入力状態に進み、そのストロークが第一打鍵となる

変換結果を直接入力する関係上、外字の入力が困難になります。常用する場合は、
((<熟語ガイド>)) と ((<外字入力補助>)) を有効にするといいでしょう。


==== 交ぜ書き変換辞書

+ 付属の交ぜ書き変換辞書

付属の交ぜ書き変換辞書 kwmaze.dic は、
((<tc2|"直接入力ソフト">)) (バージョン 2.3.1) 
のパッケージに含まれている交ぜ書き変換辞書作成キットで作成し、
コード変換 (Shift-JIS, CR/LF) したものです。
T-Code か TUT-Code の 2 ストローク漢字であれば、
読みに含めることができます
(補足 … CERTAIN (漢字で入力しなければならない文字集合) として空集合を、
また UNCERTAIN (漢字で入力してもかなで入力してもよい文字集合) として、
T-Code の基本文字の漢字集合 (1159 字) と 
TUT-Code の 2 ストローク漢字集合 (725 字) の和集合に、
漢字に準じる 3 文字「々〆〇」を加えた計 1183 字を指定して作成したもの)。

なお、交ぜ書き変換辞書は、本来、
ユーザ自身が各自の習熟度に合わせて作成するべきものです。
完全に覚えてしまった漢字を辞書から削除することで、
変換効率を上げることができ、辞書のサイズも小さくすることができるからです。
交ぜ書き変換辞書の作成法については、((<tc2|"直接入力ソフト">)) の
パッケージのドキュメントを参照してください。

+ 交ぜ書き変換辞書の書式

交ぜ書き変換辞書の書式は、
次のようなエントリを 1 行に 1 つずつ書いたものです。
  <読み> /<候補>/<候補>/…/<候補>/
つまり、
* 読み
* 半角空白を 1 つ
* 候補を、スラッシュ ((({/}))) で区切って並べたもの (両端にもスラッシュが必要)
を、順に並べたものです。
たとえば、次のように書きます。
  かん字 /換字/漢字/
活用する語は、
  かんじ― /感じ/
のように、活用語尾を、全角ダッシュ ((({―}))) で表記します。

読みに空白を含めたり、候補にスラッシュを含めたりすることは
(おそらく) できません。

交ぜ書き変換辞書を書き換える場合は、
重複する定義を避け、またソートしておくようにしましょう。
「漢直Win」の現在の仕様では、ソートされていなくてもかまいませんが、
他のドライバと辞書を共用する場合に、問題になることがあります。






=== 文字ヘルプ

((<部首合成変換>)) や ((<交ぜ書き変換>)) で入力した文字の中に、
直接入力できる文字があった場合、
自動的にその文字の打鍵図が表示されます。

=end
=begin html
<table class="figure" summary="文字ヘルプの図示">
<caption>文字ヘルプ</caption>
<tr>
<td>
<img src="img/bushu_help.png" alt="文字ヘルプ" title="文字ヘルプ" />
</td>
</tr>
</table>
=end
=begin

打鍵図における、記号と彩色の意味は次のとおりです。
記号は ((<tc2|"直接入力ソフト">)) とほぼ同様の割り当て、
彩色は「((<漢索窓>))」と共通です。
* ((%[{bgred}●]%)) (赤) … 第 1 打鍵
* ((%[{bggrn}○]%)) (緑) … 第 2 打鍵
* ((%[{bgyel}△]%)) (黄) … 第 3 打鍵
* ((%[{bggry}◇]%)) (灰) … 第 4 打鍵 (またはそれ以降の打鍵)
* ((%[{bgblu}◎]%)) (青) … 2 回打鍵するキー
* ((%[{bgcyn}☆]%)) (水) … 3 回打鍵するキー (または別の 2 回打鍵するキー)
=end
<ul>
  <li><kbd><span class="st1">●</span></kbd> (赤): 第 1 打鍵</li>
  <li><kbd><span class="st2">○</span></kbd> (緑): 第 2 打鍵</li>
  <li><kbd><span class="st3">△</span></kbd> (黄): 第 3 打鍵</li>
  <li><kbd><span class="stf">◇</span></kbd> (灰): 第 4 打鍵
                                             (またはそれ以降の打鍵)</li>
  <li><kbd><span class="stw">◎</span></kbd> (青): 2 回打鍵するキー</li>
  <li><kbd><span class="stx">☆</span></kbd> (水): 3 回打鍵するキー
      (または別の 2 回打鍵するキー)</li>
</ul>
=begin
交ぜ書き変換で、文字が複数ある場合、
仮想鍵盤上の「((%≪%))」のキーを押すと、2 文字目以降の打鍵図を表示します。
「((%≪%))」は、T-Code では ((%4%))((%4%)), TUT-Code では ((%-%)) に
割り当てられています。

続けて「((%≪%))」を押すと、以前に文字ヘルプの対象になった文字の打鍵図を、
さかのぼって表示します。
また、「((%≫%))」と表示されているキーを押すと、逆方向に表示します。
「((%≫%))」は、T-Code では ((%4%))((%5%)),
TUT-Code では ((%^%)) (英語キーボードの場合は ((%=%))) 
に割り当てられています。


打鍵図は、入力を続行すると消えますが、
「((%≪%))」または「((%≫%))」のキーを押すことで、
再度表示することができます。

なお、外字 (直接入力できない文字) や、
交ぜ書き変換の読みに含まれていた文字は無視され、
文字ヘルプの対象にはなりません。





=== 熟語ガイド

熟語ガイド[^[((<ver1.27a|変更履歴>))]^] は、
熟語を入力する時に、2 文字目以降の文字の打ち方を
仮想鍵盤上に表示する補助機能です。

「漢直Win」のデフォルトの設定では、熟語ガイドは無効になっています。
熟語ガイドを使用するには、((<初期設定ファイル>)) kanchoku.ini の
(({((*;*))gg=kwgg.dic}))
と書いてある行を
(({gg=kwgg.dic}))
のように変更してください。

=end
=begin html
<table class="figure" summary="熟語ガイドの図示">
<caption>熟語ガイド</caption>
<tr>
<td>
<img src="img/gg.png" alt="熟語ガイド" title="熟語ガイド" />
</td>
</tr>
</table>
=end
=begin

* 漢字を入力した後、その漢字に続く文字の候補が、
  仮想鍵盤上に紫色で表示されます。
* 候補が表示される位置は、各文字の第 1 打鍵の位置です。
  該当するキーを打鍵すると、第 2 打鍵の位置が紫色で表示されますので、
  引き続きキーを入力します。
* 仮想鍵盤の表示が変わる (紫色の表示の部分) だけで、
  文字の打ち方自体は変わりません。
* 仮想鍵盤の同じキーに、複数の候補が重複している場合は、
  「((%２%))」や「((%３%))」などのように表示されます。
* 実際にガイドされる文字は、((<熟語ガイド辞書>)) で決められます。

==== 熟語ガイド辞書

「漢直Win 1.27a」のパッケージには、熟語ガイド辞書のサンプルとして、
kwgg.dic を付属しました。
kwgg.dic は、交ぜ書き変換辞書 kwmaze.dic から、
漢字を含むすべての連なりを機械的に拾い出して作成したものです。

特に高頻度の漢字に対しては、候補の重複により、
「((%２%))」や「((%３%))」のように表示されてしまうことが多いようです。
すでに覚えてしまった漢字や
直接入力するつもりのない漢字を
熟語ガイド辞書から削除することにより、
熟語ガイドの精度を向上できるかも知れません。

+ 熟語ガイド辞書の書式

熟語ガイドの書式は、次のような形式の行を並べたものとなっているようです。
  <文字列> /<文字の並び>
(({<文字列>})) の後に続く可能性のある文字を、
(({<文字の並び>})) として、半角空白・空角スラッシュの後に
並べて書きます。
例えば、
  不可 /解限欠思能避分
というエントリが辞書にあるとき、「不可」と入力した後に
「解限欠思能避分」の各文字のガイドが表示されることになります。

エントリはソートされている必要はありませんが、重複していてはいけません。
なお、熟語ガイド辞書は、いわゆる外字 (ストロークを割り当てられていない文字
のこと) を含んでいてもかまいません。

[^[((<ver1.27e|変更履歴>))]^]
次のように、一行でマッチ対象パターンを複数指定することもできます。
  ぁ ぃ ぅ ぇ ぉ あ い う え お /ぁぃぅぇぉあいうえお





=== その他の機能

その他の機能を説明します。

==== かたかなの入力

TUT-Code で、かたかなを入力するには、
次のような方法があります。

:かたかなモード
  仮想鍵盤上の「((%ア%))」のキーを押すと、かたかなモードになります。
  このモードで、ひらがなを入力すると、かたかなに変換されて入力されます。
  「((%ア%))」は、((%@%)) (英語キーボードの場合は ((%[%))) 
  に割り当てられています。

  もう一度「((%ア%))」のキーを押すと、ひらがなモードに戻ります。

:シフト打鍵による入力
  ((<初期設定ファイル>)) にて、オプション (({shiftKana=1})) と指定すると、
  シフトキーを押しながらひらがなを入力することで、
  かたかなを入力することができるようになります。
  [:del:]
  ただし、このオプションを指定すると、本来シフトキーを用いて入力する文字
  (大文字や記号など) は入力できなくなります。
  [:/del:]
  なお、シフト打鍵は、かな文字の入力に使うキーだけを「漢直Win」側で取り、
  それ以外のキーのシフト打鍵は、
  通常の打鍵として扱われます[^[((<ver1.27a|変更履歴>))]^]。

:交ぜ書き変換のかたかな変換
  ((<交ぜ書き変換>)) の読み入力モードで、入力したひらがなを
  ((%Tab%)) によりかたかなに変換して入力することができます。

  なお、この場合、変換したかたかなは ((<ヒストリ入力>)) の対象になります。

:後置型のかたかな変換を使ってかたかなに変換
  ((<テーブルファイル>)) で ((<後置型のかたかな変換>)) を割り当てた
  キーを押すと、後置型でかたかな変換ができます。

==== 全角モード

仮想鍵盤上の「((%全%))」のキーを押すと、
全角モードになります。
このモードでは、テーブルに定義されている
半角の数字や記号が、全角に変換されて入力されます。
「((%全%))」は、T-Code では ((%3%))((%3%)) に割り当てられています。

もう一度「((%全%))」のキーを押すと、半角モードに戻ります。

==== 句読点の切り替え

仮想鍵盤上の「((%句%))」のキーを押すと、
句読点を「、。」から「，．」に変更できます。
「((%句%))」は、T-Code では ((%3%))((%2%)),
TUT-Code では ((%[%)) (英語キーボードの場合は ((%]%))) 
に割り当てられています。

もう一度「((%句%))」のキーを押すと、もとの句読点に戻ります。





==== ヒストリ入力

ヒストリ入力は、最近に入力した文字を再入力するための補助入力です。
部首合成変換で入力した文字や、交ぜ書き変換で入力した熟語を、
一時的にキャッシュしておいて、必要なときに呼び出すことができます。

変換入力した文字のうち、以下のいずれかの条件を満たすものが、
ヒストリに残されます。
* 外字 (直接入力できない文字) を少なくとも 1 文字含んでいる
* 3 文字以上の長さである

仮想鍵盤上の「((%◎%))」のキー
を打鍵すると、((*ヒストリ入力モード*)) になり、
最近変換入力した文字が仮想鍵盤に表示されます (図)。
「((%◎%))」は、T-Code では ((%:%)) (英語キーボードの場合は
((%'%))) に割り当てられています。

この状態でキーを押すと、仮想鍵盤上の対応する列の候補が入力されます。
また、((%Esc%)), ((%Space%)), ((%Enter%)) のいずれかのキーを押すと、
もとの通常入力モードに戻ります。

=end
=begin html
<table class="figure" summary="ヒストリ入力の図示">
<caption>ヒストリ入力</caption>
<tr>
<td>
<img src="img/hist.png" alt="ヒストリ入力" title="ヒストリ入力" />
</td>
</tr>
</table>
=end
=begin

* [{bgcyn}背景が水色の候補]は直前にヒストリに追加されたもの、
  また、[{fgred}赤字の候補]は最近呼び出されたことがあるものを示しています。
* ヒストリには 10 個まで候補が保存されます。
  10 個を超えた場合は、最近呼び出されなかったもの (すなわち、
  赤字でない候補) から上書きされます。
* 交ぜ書き変換で、無変換で確定 (((%Enter%))) したものや、
  ひらがな/かたかな変換で確定 (((%Tab%))) したものについても、
  3文字以上であれば、ヒストリの対象になります。





==== 後置型の変換

すでに説明した ((<部首合成変換>)) と ((<交ぜ書き変換>)) は、いずれも、
変換する読みや部品を入力する前にモードを指定する、((*前置型*)) の変換でした。

これとは逆の ((*後置型*)) の変換もあります。
後置型では、まず変換する読みや部品を直接入力します。
そのあとで所定の変換キーを押すと、カーソルの直前の文字が変換されます。

「漢直Win」でも後置型の変換を利用可能ですが、
次のような制限があります。

* 「漢直Win」は、
  実際にカーソルのある位置の文字を見て変換しているわけではなく、
  内部のバッファに記憶している読みをもとに変換を行います。
  したがって、
  カーソルを移動したり「漢直Win」をいったん OFF にしたりしたあとでは、
  期待した動作を行いません。

* ((%BackSpace%)) による文字の消去には、一応は対応していますが、
  完全ではありません。

* 変換を実行したあと、すでに入力されている読みを消去するために、
  ((%BackSpace%)) を対象ソフトに送っています。
  したがって、ソフトによってはうまく動かないことがあります。
  また、((%BackSpace%)) を送るタイミングによって、
  文字が正常に置き換えられない場合があるようです。

  変換後の文字が消去されて変換前の文字が残ってしまう場合、
  ((<初期設定ファイル>)) の「(({outputSleep=((|n|))}))」オプションで、
  ((|n|)) の値を大きくすると、
  改善できることがあります[^[((<ver1.27a|変更履歴>))]^]。

* 後置型の交ぜ書き変換の場合、読みの文字数を明示的に指定する必要があります。

なお、前置型の変換の途中で、
ミニバッファの内容に対して後置型の変換を行えます[^[((<ver1.27c|変更履歴>))]^]。

+ 後置型の部首合成変換

T-Code 用テーブルファイル t.tbl では、((%7%))((%7%)) に
この機能が割り当てられています。
仮想鍵盤では「((%部%))」と表示されます。

((%7%))((%7%)) と打鍵すると、カーソル直前の 2 文字が合成され、変換結果で
置き換えられます。
続けて ((%7%))((%7%)) を実行することにより、さらに変換結果を用いた部首合成変換
が行えます。

+ 後置型の交ぜ書き変換

T-Code 用テーブルファイル t.tbl では、((%1%))((%8%)) ～ ((%9%))((%8%)) に
この機能が割り当てられています。
それぞれ読みの長さが 1 文字 ～ 9 文字の交ぜ書き変換に対応し、
いずれも仮想鍵盤では「((%変%))」と表示されます。

部首合成変換と同様に、変換結果を用いてさらに変換を行うことができます。

+ 後置型のかたかな変換

未割り当てです。

以下の3種類があります。
:対象の長さを指定
  かたかなに変換する文字数を指定します。
:対象の長さを指定しない
  ひらがなや「ー」が続く間、かたかな変換対象にします。
:ひらがなとして残す長さを指定
  ひらがなや「ー」が続く間、かたかな変換対象にしますが、
  指定された文字数はかたかなに変換しないでひらがなとして残します。
  かたかなに変換する文字列が長くて文字数を数えるのが面倒な場合向けです。

  「例えばあぷりけーしょん」→(2文字を残して変換)
  →「例えばアプリケーション」

また、後置型のかたかな変換を行った直後であれば、
かたかな文字列を縮めることも可能です。

「例えばあぷりけーしょん」→(対象の長さ指定無しで変換)
→「例エバアプリケーション」→(かたかな文字列を1文字縮める)
→「例えバアプリケーション」→(かたかな文字列を1文字縮める)
→「例えばアプリケーション」




==== 半角かな変換

[^[((<ver1.27f|変更履歴>))]^]
((<初期設定ファイル>)) kanchoku.ini で、
  enableHankakuKana=1
と指定した場合、
((<全角モード>)) でかたかなを入力すると、
半角かなに変換されます。





==== 入力の統計

[^[((<ver1.27f|変更履歴>))]^]
((<初期設定ファイル>)) kanchoku.ini で、
  record=kwrecord.txt
  stat=kwstat.txt
のように、記録ファイル名を指定すると、入力文字の統計を取ることができます。

kwrecord.txt には、次のような書式で記録されます。
  Dec 25 18:26  文字:   56  部首:   0(0%)  交ぜ書き:   0(0%)  機能:   0(0%)
  Dec 25 18:37  文字:  190  部首:   0(0%)  交ぜ書き:   0(0%)  機能:   0(0%)
  Dec 25 18:50  文字:  508  部首:   0(0%)  交ぜ書き:   0(0%)  機能:   0(0%)
  …
各項目の意味は以下のとおりです。
* 日付・時刻 … 漢直Win を終了した時刻
* 文字 … 直接入力した文字数
* 部首 … 部首合成で入力した文字数 (の全打鍵数に対する割合)
* 交ぜ書き … 交ぜ書きで入力した文字数 (の全打鍵数に対する割合)
* 機能 … 特殊機能 (補助入力、文字ヘルプ、かなモードなど) を
  使用した回数 (の全打鍵数に対する割合)

一方、 kwstat.txt には、次のような書式で記録されます。
  、      137     0
  。      126     0
  あ      31      0
  い      216     0
  う      77      0
  …      …      …
  愛      2       0
  悪      7       0
  圧      2       0
  …      …      …

フィールドは Tab で区切られ、各フィールドの意味は、左から順に、
* 対象文字
* 直接入力した回数
* 補助入力した回数 (部首合成、交ぜ書きなど)
です。

* kwrecord.txt には、
  漢直Win を終了するごとに、そのセッションでの入力記録が、
  追加して書き込まれます。
* kwstat.txt には、
  漢直Win を終了するごとに、過去の入力情報を含めた累計の統計が、
  上書きして書き込まれます。
* kwrecord.txt の書式は、
  ((<tc2|"直接入力ソフト">)) の .tc-record の書式に倣っています。
  日付は、年を含まないことに注意してください。
* 部首合成や交ぜ書きの読みとして入力した文字も、
  直接入力した文字数に含まれます。
  たとえば、「((%◇%))き社」の読みで「貴社」と交ぜ書き変換した場合、
  直接入力で入力した文字は「き(1)」「社(1)」の計 2 文字、
  交ぜ書きで入力した文字は「貴(1)」「社(1)」の計 2 文字、
  特殊機能を使用した回数は 1 回、とカウントされます。




==== 外字入力補助

[^[((<ver1.28|変更履歴>))]^]
熟語ガイドを有効にしたうえで、((<初期設定ファイル>)) kanchoku.ini で、
  prefixautoassign=-46>
のように(((<テーブルファイルの書式>))の矢印定義形式を参照のこと)
キー番号の並びを指定すると、熟語ガイド辞書に含まれている外字を入力
したい状況になった場合に、該当する外字が、指定したキー番号並びで始まる
打鍵に一時的に自動で割り当てられます。
* テーブルファイルの該当するストロークは空定義かブロック定義である必要があります。
  ブロック定義の中が完全に空である必要はありません。

=end
