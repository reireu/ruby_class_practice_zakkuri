# キャラの登場
puts "私の一番可愛いところに気付いてる？"
puts "ふふっ、やっときたわね？"
puts "今日はちょっとしたゲームよ。"
puts "私のこと、どれだけわかってるか試してあげる。"
puts "-----------------------------"

# 正解数カウント
score = 0

# 第1問
puts "第1問:かわいいのはどっち？"
puts "1. 私の顔"
puts "2. 私の服"
puts "3. あなたの元カノ"
print "あなたの答え（番号で）: "
answer = gets.chomp

if answer == "1"
  puts "…ふふ、よく見てるじゃない。"
  score += 1
else
  puts "え？そこじゃないのに…"
  end
puts "-----------------------------"

# 第2問
puts "第2問:今日の私、何が違う？"
puts "1. いつもよりおしゃれしてきた"
puts "2. ちょっと太った"
puts "3. 元カノに似てきた"
print "あなたの答え（番号で）: "
answer = gets.chomp

if answer == "1"
  puts "そうなの、今日は巻いてみたの♡"
  score += 1
else
  puts "ちがうよぉ…そこは変えてないのに。"
  end
puts "-----------------------------"

# 第3問
puts "第3問:私のいいところは？"
puts "1. ママに比べたらなにもない"
puts "2. そんなものない"
puts "3. 全部"
print "あなたの答え（番号で）: "
answer = gets.chomp

if answer == "3"
  puts "きゃー♡ わかってるじゃない！"
  score += 1
else
  puts "…うぅ、全部って言ってほしかったのに。"
  end
puts "-----------------------------"

# エンディング
if score == 3
  puts "ぜ〜んぶ正解っ♡"
  puts "…うれしい。大好きっ！"
else
  puts "…もう、拗ねた。知らない。"
  puts "ゲームオーバー。"
end
