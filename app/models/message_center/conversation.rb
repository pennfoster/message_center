class MessageCenter::Conversation < ActiveRecord::Base
  self.table_name = :message_center_conversations

  include MessageCenter::ConversationCoreConcerns
end
