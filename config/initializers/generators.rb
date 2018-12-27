Rails.application.config.generators do |g|
  g.helper false # Railsの学習をしやすくするため、rails g で生成するファイルを減らす
  g.assets false # CSS JavaScriptファイルを生成しない
  g.skip_routes true # config/routes.rbを変更しない
  g.test_framework false
end
