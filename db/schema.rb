# This file is auto-generated from the current state of the database. Instead of editing this file, 
# please use the migrations feature of Active Record to incrementally modify your database, and
# then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your database schema. If you need
# to create the application database on another system, you should be using db:schema:load, not running
# all the migrations from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20090722201232) do

  create_table "annotation_categories", :force => true do |t|
    t.text     "annotation_category_name"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "assignment_id",            :null => false
  end

  add_index "annotation_categories", ["assignment_id"], :name => "index_annotation_categories_on_assignment_id"

  create_table "annotation_texts", :force => true do |t|
    t.text     "content"
    t.integer  "annotation_category_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "annotation_texts", ["annotation_category_id"], :name => "index_annotation_texts_on_annotation_category_id"

  create_table "annotations", :force => true do |t|
    t.integer "line_start"
    t.integer "line_end"
    t.integer "annotation_text_id"
    t.integer "submission_file_id"
  end

  add_index "annotations", ["annotation_text_id"], :name => "index_annotations_on_annotation_text_id"
  add_index "annotations", ["annotation_text_id"], :name => "index_annotations_on_description_id"
  add_index "annotations", ["submission_file_id"], :name => "index_annotations_on_assignmentfile_id"
  add_index "annotations", ["submission_file_id"], :name => "index_annotations_on_submission_file_id"

  create_table "assignment_files", :force => true do |t|
    t.integer  "assignment_id"
    t.string   "filename",      :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "assignment_files", ["assignment_id", "filename"], :name => "index_assignment_files_on_assignment_id_and_filename", :unique => true
  add_index "assignment_files", ["assignment_id"], :name => "index_assignment_files_on_assignment_id"

  create_table "assignments", :force => true do |t|
    t.string   "name",                                    :null => false
    t.string   "description"
    t.text     "message"
    t.datetime "due_date"
    t.integer  "group_min",                :default => 1, :null => false
    t.integer  "group_max",                :default => 1, :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "student_form_groups"
    t.datetime "student_invite_until"
    t.boolean  "group_name_autogenerated"
    t.boolean  "group_name_displayed"
    t.string   "repository_folder",                       :null => false
  end

  add_index "assignments", ["name"], :name => "index_assignments_on_name", :unique => true

  create_table "extra_marks", :force => true do |t|
    t.integer  "result_id"
    t.string   "description"
    t.float    "extra_mark"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "extra_marks", ["result_id"], :name => "index_extra_marks_on_result_id"

  create_table "grace_period_deductions", :force => true do |t|
    t.integer  "membership_id"
    t.integer  "deduction"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "grace_period_deductions", ["membership_id"], :name => "index_grace_period_deductions_on_membership_id"

  create_table "groupings", :force => true do |t|
    t.integer  "group_id",                          :null => false
    t.integer  "assignment_id",                     :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "admin_approved", :default => false, :null => false
  end

  add_index "groupings", ["assignment_id"], :name => "index_groupings_on_assignment_id"
  add_index "groupings", ["group_id"], :name => "index_groupings_on_group_id"

  create_table "groups", :force => true do |t|
    t.text "group_name"
  end

  create_table "marks", :force => true do |t|
    t.integer  "result_id"
    t.integer  "rubric_criterion_id"
    t.integer  "mark"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "marks", ["result_id"], :name => "index_marks_on_result_id"
  add_index "marks", ["rubric_criterion_id"], :name => "index_marks_on_rubric_criterion_id"

  create_table "memberships", :force => true do |t|
    t.integer  "user_id"
    t.string   "membership_status"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "grouping_id",       :null => false
    t.string   "type"
  end

  add_index "memberships", ["grouping_id"], :name => "index_memberships_on_grouping_id"
  add_index "memberships", ["user_id"], :name => "index_memberships_on_user_id"

  create_table "periods", :force => true do |t|
    t.integer  "submission_rule_id"
    t.float    "deduction"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.float    "hours"
  end

  add_index "periods", ["submission_rule_id"], :name => "index_periods_on_submission_rule_id"

  create_table "results", :force => true do |t|
    t.integer  "submission_id"
    t.string   "marking_state"
    t.string   "overall_comment"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "released_to_students", :default => false, :null => false
  end

  create_table "rubric_criteria", :force => true do |t|
    t.string   "rubric_criterion_name", :null => false
    t.integer  "assignment_id",         :null => false
    t.decimal  "weight",                :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "position"
    t.text     "level_0_name"
    t.text     "level_0_description"
    t.text     "level_1_name"
    t.text     "level_1_description"
    t.text     "level_2_name"
    t.text     "level_2_description"
    t.text     "level_3_name"
    t.text     "level_3_description"
    t.text     "level_4_name"
    t.text     "level_4_description"
  end

  add_index "rubric_criteria", ["assignment_id", "rubric_criterion_name"], :name => "index_rubric_criteria_on_assignment_id_and_name", :unique => true
  add_index "rubric_criteria", ["assignment_id"], :name => "index_rubric_criteria_on_assignment_id"

  create_table "sessions", :force => true do |t|
    t.string   "session_id", :null => false
    t.text     "data"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "sessions", ["session_id"], :name => "index_sessions_on_session_id"
  add_index "sessions", ["updated_at"], :name => "index_sessions_on_updated_at"

  create_table "submission_files", :force => true do |t|
    t.integer  "user_id"
    t.integer  "submission_id"
    t.string   "filename"
    t.datetime "submitted_at"
    t.string   "submission_file_status"
    t.string   "path",                   :default => "/", :null => false
  end

  add_index "submission_files", ["filename"], :name => "index_submission_files_on_filename"
  add_index "submission_files", ["submission_id"], :name => "index_submission_files_on_submission_id"
  add_index "submission_files", ["user_id"], :name => "index_submission_files_on_user_id"

  create_table "submission_rules", :force => true do |t|
    t.integer  "allow_submit_until",    :default => 0
    t.string   "type",                  :default => "NullSubmissionRule"
    t.integer  "grace_day_limit"
    t.integer  "penalty_limit"
    t.integer  "penalty_increment"
    t.integer  "penalty_interval"
    t.string   "penalty_interval_unit"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "assignment_id"
  end

  add_index "submission_rules", ["assignment_id"], :name => "index_submission_rules_on_assignment_id"

  create_table "submissions", :force => true do |t|
    t.integer  "grouping_id"
    t.datetime "created_at"
    t.integer  "submission_version"
    t.boolean  "submission_version_used"
    t.integer  "revision_number",         :null => false
    t.datetime "revision_timestamp",      :null => false
  end

  add_index "submissions", ["grouping_id"], :name => "index_submissions_on_grouping_id"

  create_table "users", :force => true do |t|
    t.string   "user_name",                        :null => false
    t.string   "last_name"
    t.string   "first_name"
    t.integer  "grace_credits", :default => 0,     :null => false
    t.string   "type"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "hidden",        :default => false, :null => false
  end

  add_index "users", ["user_name"], :name => "index_users_on_user_name", :unique => true

end
