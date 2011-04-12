require 'openid/store/filesystem'

Rails.application.config.middleware.use OmniAuth::Builder do
  provider(
    :twitter,
    $appconf[RAILS_ENV]['provider']['twitter']['app_id'],
    $appconf[RAILS_ENV]['provider']['twitter']['secret']
  )

  provider(
    :facebook,
    $appconf[RAILS_ENV]['provider']['facebook']['app_id'],
    $appconf[RAILS_ENV]['provider']['facebook']['secret']
  )

  #provider :open_id, OpenID::Store::Filesystem.new('/tmp')
  provider(
    :open_id,
    OpenID::Store::Filesystem.new('/tmp'),
    :name => 'google',
    :identifier => 'https://www.google.com/accounts/o8/id'
  )
end

