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
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20151007055936) do

  create_table "badges", :force => true do |t|
    t.string   "code"
    t.string   "category"
    t.string   "title"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "categories", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.string   "deal_type"
  end

  create_table "categories_offers", :id => false, :force => true do |t|
    t.integer "category_id"
    t.integer "offer_id"
  end

  create_table "charities", :force => true do |t|
    t.string   "name"
    t.string   "web"
    t.integer  "region_id"
    t.string   "address"
    t.string   "city"
    t.integer  "state_id"
    t.string   "zip"
    t.text     "description"
    t.datetime "created_at",                                                                                 :null => false
    t.datetime "updated_at",                                                                                 :null => false
    t.string   "image_uid"
    t.string   "charity_type"
    t.string   "subdomain"
    t.string   "use_funds"
    t.string   "logo_uid"
    t.string   "photo_uid"
    t.boolean  "active",                                                                   :default => true
    t.integer  "order"
    t.float    "lat"
    t.float    "lon"
  end

  create_table "charity_photos", :force => true do |t|
    t.integer  "charity_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.string   "photo_uid"
  end

  create_table "delayed_jobs", :force => true do |t|
    t.integer  "priority",   :default => 0
    t.integer  "attempts",   :default => 0
    t.text     "handler"
    t.text     "last_error"
    t.datetime "run_at"
    t.datetime "locked_at"
    t.datetime "failed_at"
    t.string   "locked_by"
    t.string   "queue"
    t.datetime "created_at",                :null => false
    t.datetime "updated_at",                :null => false
  end

  add_index "delayed_jobs", ["priority", "run_at"], :name => "delayed_jobs_priority"

  create_table "experience_taggables", :force => true do |t|
    t.integer  "experience_tag_id"
    t.integer  "venue_id"
    t.datetime "created_at",        :null => false
    t.datetime "updated_at",        :null => false
  end

  create_table "experience_tags", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "external_uids", :force => true do |t|
    t.integer  "user_id"
    t.string   "uid"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "follow_up_notes", :force => true do |t|
    t.integer  "charity_id"
    t.text     "note"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "follow_up_notes", ["charity_id"], :name => "index_follow_up_notes_on_charity_id"

  create_table "follow_up_notes_users", :id => false, :force => true do |t|
    t.integer "follow_up_note_id"
    t.integer "user_id"
  end

  create_table "invoices", :force => true do |t|
    t.string   "group_name"
    t.integer  "group_size"
    t.string   "code"
    t.datetime "time"
    t.string   "perk"
    t.decimal  "amount"
    t.string   "venue"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "long_tasks", :force => true do |t|
  end

  create_table "news", :force => true do |t|
    t.string   "title"
    t.string   "mobile_image_uid"
    t.string   "website_image_uid"
    t.string   "mobile_url"
    t.string   "website_url"
    t.datetime "created_at",        :null => false
    t.datetime "updated_at",        :null => false
    t.integer  "order"
  end

  create_table "notification_requests", :force => true do |t|
    t.integer  "user_id"
    t.integer  "venue_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "notifications", :force => true do |t|
    t.text     "content"
    t.string   "ticker"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "offers", :force => true do |t|
    t.integer  "venue_id"
    t.string   "name"
    t.text     "details"
    t.integer  "min_diners"
    t.datetime "created_at",     :null => false
    t.datetime "updated_at",     :null => false
    t.integer  "available"
    t.integer  "total"
    t.float    "price"
    t.float    "original_price"
    t.string   "times"
  end

  create_table "open_times", :force => true do |t|
    t.integer  "openable_id"
    t.string   "openable_type"
    t.integer  "start"
    t.integer  "end"
    t.date     "start_date"
    t.date     "end_date"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
  end

  create_table "payment_notifications", :force => true do |t|
    t.string   "status"
    t.string   "address_city"
    t.string   "address_name"
    t.string   "address_state"
    t.string   "address_street"
    t.string   "address_zip"
    t.string   "first_name"
    t.string   "last_name"
    t.string   "invoice"
    t.string   "mc_currency"
    t.string   "mc_gross"
    t.string   "payer_email"
    t.string   "payer_status"
    t.string   "payment_type"
    t.string   "verify_sign"
    t.integer  "txn_id"
    t.integer  "transaction_id"
    t.integer  "paypal_id"
    t.integer  "user_id"
    t.text     "parameters"
    t.datetime "payment_date"
    t.datetime "created_at",     :null => false
    t.datetime "updated_at",     :null => false
  end

  create_table "payments", :force => true do |t|
    t.integer  "user_id"
    t.float    "amount"
    t.string   "stripe_charge_token"
    t.datetime "created_at",          :null => false
    t.datetime "updated_at",          :null => false
    t.integer  "offer_id"
    t.string   "code"
    t.integer  "num_diners"
    t.string   "occasion"
    t.boolean  "confirmed"
    t.datetime "time_confirmed"
    t.string   "coupon"
    t.string   "name"
    t.string   "phone"
    t.boolean  "called"
    t.string   "state"
    t.string   "paypal_charge_token"
    t.integer  "charity_id"
    t.string   "friend"
  end

  add_index "payments", ["user_id"], :name => "index_payments_on_user_id"

  create_table "postcards", :force => true do |t|
    t.string   "city",                               :null => false
    t.string   "state",                              :null => false
    t.string   "user_name",                          :null => false
    t.string   "restaurant_name",                    :null => false
    t.text     "message",                            :null => false
    t.boolean  "sent",            :default => false
    t.datetime "created_at",                         :null => false
    t.datetime "updated_at",                         :null => false
  end

  create_table "rails_admin_histories", :force => true do |t|
    t.text     "message"
    t.string   "username"
    t.integer  "item"
    t.string   "table"
    t.integer  "month",      :limit => 2
    t.integer  "year",       :limit => 8
    t.datetime "created_at",              :null => false
    t.datetime "updated_at",              :null => false
  end

  add_index "rails_admin_histories", ["item", "table", "month", "year"], :name => "index_rails_admin_histories"

  create_table "regions", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "remind_lists", :force => true do |t|
    t.string   "phone"
    t.string   "email"
    t.string   "blah"
    t.datetime "last_reminded"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
  end

  create_table "reservations", :force => true do |t|
    t.integer  "user_id"
    t.integer  "venue_id"
    t.integer  "offer_id"
    t.integer  "charity_id"
    t.integer  "num_diners"
    t.string   "occasion"
    t.boolean  "confirmed"
    t.datetime "time_confirmed"
    t.string   "coupon"
    t.string   "name"
    t.string   "phone"
    t.datetime "created_at",                        :null => false
    t.datetime "updated_at",                        :null => false
    t.boolean  "called",         :default => false
    t.string   "state"
    t.float    "amount"
    t.string   "code"
  end

  create_table "restaurants", :force => true do |t|
    t.string   "name"
    t.string   "email"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "reviews", :force => true do |t|
    t.string   "author_name"
    t.text     "content"
    t.integer  "rating"
    t.integer  "venue_id"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
    t.integer  "time"
  end

  add_index "reviews", ["venue_id"], :name => "index_reviews_on_venue_id"

  create_table "sessions", :force => true do |t|
    t.string   "session_id", :null => false
    t.text     "data"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "sessions", ["session_id"], :name => "index_sessions_on_session_id"
  add_index "sessions", ["updated_at"], :name => "index_sessions_on_updated_at"

  create_table "social_links", :force => true do |t|
    t.integer  "venue_id"
    t.string   "url"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "socialbutterflies", :force => true do |t|
    t.string   "facebook"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "states", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "statuses", :force => true do |t|
    t.string   "status"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "time_zones", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "user_badges", :force => true do |t|
    t.integer  "user_id"
    t.integer  "badge_id"
    t.boolean  "sent_email"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "user_badges", ["badge_id"], :name => "index_user_badges_on_badge_id"
  add_index "user_badges", ["user_id"], :name => "index_user_badges_on_user_id"

  create_table "users", :force => true do |t|
    t.string   "email",                  :default => "",         :null => false
    t.string   "encrypted_password",     :default => "",         :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                                     :null => false
    t.datetime "updated_at",                                     :null => false
    t.string   "name"
    t.string   "phone"
    t.boolean  "admin",                  :default => false
    t.string   "provider"
    t.string   "twitter_uid"
    t.string   "city"
    t.integer  "zip"
    t.string   "gender"
    t.datetime "birthday"
    t.string   "stripe_customer_token"
    t.string   "authentication_token"
    t.string   "twitter_secret"
    t.string   "twitter_token"
    t.string   "facebook_secret"
    t.string   "facebook_token"
    t.boolean  "has_twitter",            :default => false,      :null => false
    t.boolean  "has_facebook",           :default => false,      :null => false
    t.text     "friends",                :default => "--- []\n", :null => false
    t.string   "facebook_uid"
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true

  create_table "venue_taggables", :force => true do |t|
    t.integer  "venue_tag_id"
    t.integer  "venue_id"
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
  end

  create_table "venue_tags", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "venues", :force => true do |t|
    t.string   "name"
    t.integer  "user_id"
    t.text     "description"
    t.string   "address"
    t.string   "city"
    t.integer  "state_id"
    t.string   "zip"
    t.string   "neighborhood"
    t.string   "web"
    t.integer  "price"
    t.datetime "created_at",                                                                                                             :null => false
    t.datetime "updated_at",                                                                                                             :null => false
    t.string   "main_image_uid"
    t.string   "phone"
    t.string   "restaurant_tile_image_uid"
    t.integer  "time_zone_id"
    t.float    "rating"
    t.string   "reference"
    t.boolean  "active",                                                                                :default => true
    t.spatial  "latlon",                    :limit => {:srid=>4326, :type=>"point", :geographic=>true}
    t.string   "voucher",                                                                               :default => "5"
    t.decimal  "multiplier",                                                                            :default => 1.5
    t.string   "feemessage",                                                                            :default => "Enter fee mesage."
    t.decimal  "feecharge",                                                                             :default => 0.0
    t.boolean  "apply_able",                                                                            :default => false
    t.string   "email",                                                                                 :default => "venue@example.com"
    t.string   "slug"
    t.integer  "vouchers_available",                                                                    :default => 0
    t.integer  "vouchers_total",                                                                        :default => 0
    t.string   "outside_image_uid"
    t.string   "timeline_image_uid"
    t.string   "google_maps_url"
    t.string   "times"
    t.string   "device_id"
    t.boolean  "visible",                                                                               :default => true
    t.string   "first_name"
    t.string   "last_name"
    t.text     "cc_num"
    t.string   "cc_expm"
    t.string   "cc_expy"
    t.string   "cc_cvv2"
    t.string   "cc_zip"
    t.string   "facebook"
    t.string   "twitter"
    t.string   "instagram"
    t.string   "social_media_email"
  end

  add_index "venues", ["slug"], :name => "index_venues_on_slug", :unique => true

  create_table "vouchers", :force => true do |t|
    t.date     "start_date"
    t.date     "end_date"
    t.integer  "total"
    t.integer  "available"
    t.integer  "offer_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "vouchers", ["offer_id"], :name => "index_vouchers_on_offer_id"

end
