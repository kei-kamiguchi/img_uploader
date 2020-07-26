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
