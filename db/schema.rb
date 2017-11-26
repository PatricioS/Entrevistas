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

ActiveRecord::Schema.define(version: 20171126121635) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "answercomments", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "answer_id"
    t.text "texto"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["answer_id"], name: "index_answercomments_on_answer_id"
    t.index ["user_id"], name: "index_answercomments_on_user_id"
  end

  create_table "answers", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "question_id"
    t.text "texto"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["question_id"], name: "index_answers_on_question_id"
    t.index ["user_id"], name: "index_answers_on_user_id"
  end

  create_table "comment_answers", force: :cascade do |t|
    t.string "texto"
    t.integer "puntaje"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "comment_questions", force: :cascade do |t|
    t.string "texto"
    t.integer "puntaje"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "facultads", force: :cascade do |t|
    t.string "nombre"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "universidad_id"
    t.index ["universidad_id"], name: "index_facultads_on_universidad_id"
  end

  create_table "questioncomments", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "question_id"
    t.text "texto"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["question_id"], name: "index_questioncomments_on_question_id"
    t.index ["user_id"], name: "index_questioncomments_on_user_id"
  end

  create_table "questions", force: :cascade do |t|
    t.string "titulo"
    t.text "texto"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "user_id"
    t.integer "puntaje"
    t.index ["user_id"], name: "index_questions_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string "current_sign_in_ip"
    t.string "last_sign_in_ip"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "nombre"
    t.string "apellido"
    t.string "facultad"
    t.integer "puntaje"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "answercomments", "answers"
  add_foreign_key "answercomments", "users"
  add_foreign_key "answers", "questions"
  add_foreign_key "answers", "users"
  add_foreign_key "questioncomments", "questions"
  add_foreign_key "questioncomments", "users"
  add_foreign_key "questions", "users"
end
