module MessageCenter

  module Concerns
    module Models
      autoload :Conversation, 'concerns/models/conversation'
      autoload :Item, 'concerns/models/item'
      autoload :Mailbox, 'concerns/models/mailbox'
      autoload :Message, 'concerns/models/message'
      autoload :Notification, 'concerns/models/notification'
      autoload :Receipt, 'concerns/models/receipt'
    end
  end

  module Models
    autoload :Messageable, 'message_center/models/messageable'
  end

  mattr_accessor :messageable_class
  @@messageable_class = 'User'
  mattr_accessor :default_from
  @@default_from = 'no-reply@message_center.com'
  mattr_accessor :uses_emails
  @@uses_emails = true
  mattr_accessor :use_mail_dispatcher
  @@use_mail_dispatcher = true
  mattr_accessor :mailer_wants_array
  @@mailer_wants_array = false
  mattr_accessor :search_enabled
  @@search_enabled = false
  mattr_accessor :search_engine
  @@search_engine = :solr
  mattr_accessor :email_method
  @@email_method = :message_center_email
  mattr_accessor :name_method
  @@name_method = :name
  mattr_accessor :subject_max_length
  @@subject_max_length = 255
  mattr_accessor :body_max_length
  @@body_max_length = 32000
  mattr_accessor :notification_mailer
  mattr_accessor :message_mailer
  mattr_accessor :custom_deliver_proc

  class << self
    def setup
      yield self
    end
  end

end

require 'message_center/engine'
require 'message_center/service'
require 'message_center/cleaner'
require 'message_center/mail_dispatcher'
