# encoding: UTF-8
# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20160417205113) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"
  enable_extension "hstore"

  create_table "message_center_conversation_opt_outs", force: true do |t|
    t.integer "unsubscriber_id"
    t.integer "conversation_id"
  end

  create_table "message_center_conversations", force: true do |t|
    t.string   "subject",        default: ""
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
    t.integer  "messages_count", default: 0
  end

  create_table "message_center_items", force: true do |t|
    t.string   "type"
    t.text     "body"
    t.string   "subject",              default: ""
    t.integer  "sender_id"
    t.integer  "conversation_id"
    t.boolean  "draft",                default: false
    t.string   "notification_code"
    t.integer  "notified_object_id"
    t.string   "notified_object_type"
    t.string   "attachment"
    t.datetime "updated_at",                           null: false
    t.datetime "created_at",                           null: false
    t.boolean  "global",               default: false
    t.datetime "expires_at"
    t.boolean  "bulk",                 default: false
  end

  add_index "message_center_items", ["conversation_id"], name: "index_message_center_items_on_conversation_id", using: :btree

  create_table "message_center_receipts", force: true do |t|
    t.integer  "receiver_id",                             null: false
    t.integer  "item_id",                                 null: false
    t.boolean  "is_read",                 default: false
    t.boolean  "trashed",                 default: false
    t.boolean  "deleted",                 default: false
    t.string   "mailbox_type", limit: 25
    t.hstore   "properties",              default: {},    null: false
    t.datetime "created_at",                              null: false
    t.datetime "updated_at",                              null: false
    t.integer  "sender_id"
  end

  add_index "message_center_receipts", ["item_id"], name: "index_message_center_receipts_on_item_id", using: :btree
  add_index "message_center_receipts", ["receiver_id", "mailbox_type"], name: "index_message_center_receipts_on_receiver_id_and_mailbox_type", using: :btree
  add_index "message_center_receipts", ["sender_id", "receiver_id"], name: "index_message_center_receipts_on_sender_id_and_receiver_id", using: :btree

  create_table "users", force: true do |t|
    t.string   "name"
    t.string   "email"
    t.string   "type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
