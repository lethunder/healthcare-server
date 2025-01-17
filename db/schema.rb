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

ActiveRecord::Schema.define(version: 20220504111622) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "doctor_appointments", force: :cascade do |t|
    t.text "description"
    t.datetime "from"
    t.datetime "to"
    t.bigint "doctor_id"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["doctor_id"], name: "index_doctor_appointments_on_doctor_id"
    t.index ["user_id"], name: "index_doctor_appointments_on_user_id"
  end

  create_table "doctor_notifications", force: :cascade do |t|
    t.string "title"
    t.bigint "user_id"
    t.bigint "doctor_id"
    t.datetime "notified_on"
    t.text "notes"
    t.string "severity"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["doctor_id"], name: "index_doctor_notifications_on_doctor_id"
    t.index ["user_id"], name: "index_doctor_notifications_on_user_id"
  end

  create_table "doctors", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.string "city"
    t.string "username"
    t.string "password"
    t.text "address"
    t.string "primary_practice"
    t.string "secondary_practice"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "gcmid"
  end

  create_table "in_patients", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "doctor_id"
    t.datetime "visting_since"
    t.text "notes"
    t.string "status"
    t.string "for_practice"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["doctor_id"], name: "index_in_patients_on_doctor_id"
    t.index ["user_id"], name: "index_in_patients_on_user_id"
  end

  create_table "locations", force: :cascade do |t|
    t.string "street_name"
    t.string "country_iso2", null: false
    t.float "latitude", null: false
    t.float "longitude", null: false
    t.string "formatted_address"
    t.string "postal_code"
    t.string "street_number"
    t.string "street_type"
    t.string "city_name"
    t.string "locationable_type", null: false
    t.uuid "locationable_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["city_name"], name: "index_locations_on_city_name"
    t.index ["country_iso2"], name: "index_locations_on_country_iso2"
    t.index ["latitude"], name: "index_locations_on_latitude"
    t.index ["locationable_type", "locationable_id"], name: "index_locations_on_locationable_type_and_locationable_id"
    t.index ["longitude"], name: "index_locations_on_longitude"
    t.index ["postal_code"], name: "index_locations_on_postal_code"
  end

  create_table "medicine_intake_logs", force: :cascade do |t|
    t.bigint "prescribed_medicine_id"
    t.bigint "user_id"
    t.datetime "logged_on"
    t.text "notes"
    t.string "part_of_day"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["prescribed_medicine_id"], name: "index_medicine_intake_logs_on_prescribed_medicine_id"
    t.index ["user_id"], name: "index_medicine_intake_logs_on_user_id"
  end

  create_table "medicines", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.string "medicine_type"
    t.boolean "is_acidic"
    t.boolean "infant_safe"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "nursing_homes", force: :cascade do |t|
    t.string "name", null: false
    t.bigint "location_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["location_id"], name: "index_nursing_homes_on_location_id"
  end

  create_table "prescribed_medicines", force: :cascade do |t|
    t.bigint "medicine_id"
    t.bigint "prescription_id"
    t.text "notes"
    t.boolean "before_breakfast"
    t.boolean "after_breakfast"
    t.boolean "before_lunch"
    t.boolean "after_lunch"
    t.boolean "before_dinner"
    t.boolean "after_dinner"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "available_count"
    t.index ["medicine_id"], name: "index_prescribed_medicines_on_medicine_id"
    t.index ["prescription_id"], name: "index_prescribed_medicines_on_prescription_id"
  end

  create_table "prescriptions", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "doctor_id"
    t.text "notes"
    t.datetime "prescribed_on"
    t.datetime "valid_till"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["doctor_id"], name: "index_prescriptions_on_doctor_id"
    t.index ["user_id"], name: "index_prescriptions_on_user_id"
  end

  create_table "user_vital_logs", force: :cascade do |t|
    t.bigint "user_id"
    t.datetime "logged_on"
    t.text "notes"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "pulse"
    t.decimal "sugar"
    t.decimal "temperature"
    t.decimal "pressure"
    t.index ["user_id"], name: "index_user_vital_logs_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.string "city"
    t.text "address"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "gcmid"
    t.string "middle_name"
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet "current_sign_in_ip"
    t.inet "last_sign_in_ip"
    t.string "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string "unconfirmed_email"
    t.integer "failed_attempts", default: 0, null: false
    t.string "unlock_token"
    t.datetime "locked_at"
    t.bigint "location_id"
    t.index ["confirmation_token"], name: "index_users_on_confirmation_token", unique: true
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["location_id"], name: "index_users_on_location_id"
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
    t.index ["unlock_token"], name: "index_users_on_unlock_token", unique: true
  end

  add_foreign_key "doctor_notifications", "doctors"
  add_foreign_key "doctor_notifications", "users"
  add_foreign_key "in_patients", "doctors"
  add_foreign_key "in_patients", "users"
  add_foreign_key "medicine_intake_logs", "prescribed_medicines"
  add_foreign_key "medicine_intake_logs", "users"
  add_foreign_key "prescribed_medicines", "medicines"
  add_foreign_key "prescribed_medicines", "prescriptions"
  add_foreign_key "prescriptions", "doctors"
  add_foreign_key "prescriptions", "users"
  add_foreign_key "user_vital_logs", "users"
end
