# 導入
1. ImageMagickのインストール
```
$ sudo apt-get update
$ sudo apt-get install imagemagick

#Homebrewでインストールする場合
$ brew install imagemagick
```
2. gemの追加し、インストール
```
gem 'carrierwave' # 画像をアップロードするためのgem
gem 'mini_magick' #アップロードした画像ファイルのサイズを変更するためのgem
```
3. 対象のモデルにimageカラムをtextデータ型で持たせる
4. アップローダーを作成
```
$ rails g uploader Image
```
[app/uploaders/image_uploader.rb]が作成される

5. 対象のモデルに以下を追記し、imageカラムと、ImageUploaderを紐付け
```
mount_uploader :image, ImageUploader
```
6. ストロングパラメータにカラムを追加
```
params.require(:model).permit(:image, :image_cache)
```
7. フォーム例
```
<div class="field">
  <%= form.label :image %>
  <%= form.file_field :image %>
</div>
```
8. 画像表示
```
<%= image_tag @feed.image.url %>
```
# 画像のリサイズ
https://qiita.com/nekotanku/items/5da43600f35eada64eac
[app/uploaders/image_uploader.rb]
```
class ImageUploader < CarrierWave::Uploader::Base
# minimagicが使用できるよう以下のコメントアウトを外す
  include CarrierWave::MiniMagick 

# 縦横比を維持して、全てリサイズ
  process resize_to_limit: [1200, 900]
# 縦横比を維持して、一方のみサイズ制限
  process :resize_to_limit => [500, nil]

# 余白の塗りつぶし
  process resize_to_limit: [300, 200, "#ffffff", "Center"]

# 切り抜き(全て同じサイズにリサイズされる)
  process resize_to_fill: [100, 100, "Center"]

# 指定したもののみ、縦横比を維持してリサイズ
  version :thumb do
    process resize_to_limit: [480, 360]
  end
```
# cssで画像を円形にトリミング
```
width:50px;
height:50px;
object-fit:cover;
border-radius:50%;
```
# 画像をseedデータで投入する

1. 導入したい画像をpublic配下のimagesフォルダなどに格納
2. seedデータを記述する

例
```
Food.create!(
   name: 'りんご',
   category: '果物',
   calorie: 120,
   image:File.open("./public/images/ファイル名.jpg"),
)
```
