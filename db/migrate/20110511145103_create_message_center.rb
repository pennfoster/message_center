class CreateMessageCenter < ActiveRecord::Migration
  def self.up    
  #Tables
  	#Conversations
    create_table :message_center_conversations do |t|
      t.column :subject, :string, :default => ""
      t.column :created_at, :datetime, :null => false
      t.column :updated_at, :datetime, :null => false
      t.column :messages_count, :integer, :default => 0
    end    
  	#Receipts
    create_table :message_center_receipts do |t|
      t.references :receiver, :polymorphic => true
      t.column :notification_id, :integer, :null => false
      t.column :is_read, :boolean, :default => false
      t.column :trashed, :boolean, :default => false
      t.column :deleted, :boolean, :default => false
      t.column :mailbox_type, :string, :limit => 25
      t.column :created_at, :datetime, :null => false
      t.column :updated_at, :datetime, :null => false
    end    
  	#Notifications and Messages
    create_table :message_center_notifications do |t|
      t.column :type, :string
      t.column :body, :text
      t.column :subject, :string, :default => ""
      t.references :sender, :polymorphic => true
      t.column :conversation_id, :integer
      t.column :draft, :boolean, :default => false
      t.string :notification_code, :default => nil
      t.references :notified_object, :polymorphic => true
      t.column :attachment, :string
      t.column :updated_at, :datetime, :null => false
      t.column :created_at, :datetime, :null => false
      t.boolean :global, default: false
      t.datetime :expires
    end    
    
    
  #Indexes
  	#Conversations
  	#Receipts
  	add_index "message_center_receipts","notification_id"

  	#Messages  
  	add_index "message_center_notifications","conversation_id"
  
  #Foreign keys    
  	#Conversations
  	#Receipts
  	add_foreign_key "message_center_receipts", "message_center_notifications", :name => "receipts_on_notification_id", :column => "notification_id"
  	#Messages  
  	add_foreign_key "message_center_notifications", "message_center_conversations", :name => "notifications_on_conversation_id", :column => "conversation_id"
  end
  
  def self.down
  #Tables  	
  	remove_foreign_key "message_center_receipts", :name => "receipts_on_notification_id"
  	remove_foreign_key "message_center_notifications", :name => "notifications_on_conversation_id"
  	
  #Indexes
    drop_table :message_center_receipts
    drop_table :message_center_conversations
    drop_table :message_center_notifications
  end
end