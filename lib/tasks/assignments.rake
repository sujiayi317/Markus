namespace :db do

  desc 'Create assignments'
  task :assignments => :environment do
    # Assignments

    rule = GracePeriodSubmissionRule.new
    assignment_stat = AssignmentStat.new
    puts 'Assignment 0: Grace Token usage'
    Assignment.create(
      short_identifier: 'A0',
      description: 'Variables and Simple Operations',
      message: 'using basic operators and assigning variables',
      group_min: 2,
      group_max: 3,
      student_form_groups: true,
      group_name_autogenerated: true,
      group_name_displayed: false,
      repository_folder: 'A0',
      due_date: 24.hours.ago + 5.minutes,
      allow_web_submits: true,
      display_grader_names_to_students: false,
      submission_rule: rule,
      assignment_stat: assignment_stat,
      allow_remarks: false,
      enable_test: false,
      tokens_per_period: 0,
      token_start_date: DateTime.now,
      token_period: 1
    )
    Period.create(submission_rule: rule, hours: 24)

    puts 'Assignment 1: Single Student Assignment No Marks'
    assignment_stat = AssignmentStat.new
    rule = NoLateSubmissionRule.new
    Assignment.create(
        short_identifier: 'A1',
        description: 'Conditionals and Loops',
        message: 'Learn to use conditional statements, and loops.',
        group_min: 1,
        group_max: 1,
        student_form_groups: false,
        group_name_autogenerated: true,
        group_name_displayed: false,
        repository_folder: 'A1',
        due_date: 5.minutes.from_now,
        allow_web_submits: true,
        display_grader_names_to_students: false,
        submission_rule: rule,
        assignment_stat: assignment_stat,
        allow_remarks: true,
        remark_due_date: 2.day.ago,
        enable_test: false,
        tokens_per_period: 0,
        token_start_date: DateTime.now,
        token_period: 1
    )

    rule = NoLateSubmissionRule.new
    assignment_stat = AssignmentStat.new
    assignment_msg  = <<-EOS
    Basic exercise in Object Oriented Programming.
    Implement Animal, Cat, and Dog, as described in class.
    EOS
    puts 'Assignment 2: Group Assignment No Marks'
    Assignment.create(
        short_identifier: 'A2',
        description: 'Cats and Dogs',
        message: assignment_msg,
        group_min: 2,
        group_max: 3,
        student_form_groups: true,
        group_name_autogenerated: true,
        group_name_displayed: false,
        repository_folder: 'A2',
        due_date: 5.minutes.from_now,
        allow_web_submits: true,
        display_grader_names_to_students: false,
        submission_rule: rule,
        assignment_stat: assignment_stat,
        allow_remarks: false,
        enable_test: false,
        tokens_per_period: 0,
        token_start_date: DateTime.now,
        token_period: 1
    )

    assignment_stat = AssignmentStat.new
    rule = NoLateSubmissionRule.new
    puts 'Assignment 3: Single Student Sporadic Marks'
    Assignment.create(
        short_identifier: 'A3',
        description: 'Ode to a Python program',
        message: 'Learn to use files, dictionaries, and testing.',
        group_min: 1,
        group_max: 1,
        student_form_groups: false,
        group_name_autogenerated: true,
        group_name_displayed: false,
        repository_folder: 'A3',
        due_date: 2.months.from_now,
        allow_web_submits: true,
        display_grader_names_to_students: false,
        submission_rule: rule,
        assignment_stat: assignment_stat,
        allow_remarks: false,
        enable_test: false,
        tokens_per_period: 0,
        token_start_date: DateTime.now,
        token_period: 1
    )

    rule = NoLateSubmissionRule.new
    assignment_stat = AssignmentStat.new
    puts 'Assignment 4: Group Assignment Sporadic Marks'
    Assignment.create(
        short_identifier: 'A4',
        description: 'Introduction to Recursion',
        message: 'Implement functions using Recursion',
        group_min: 2,
        group_max: 3,
        student_form_groups: true,
        group_name_autogenerated: true,
        group_name_displayed: false,
        repository_folder: 'A4',
        due_date: 2.months.from_now,
        allow_web_submits: true,
        display_grader_names_to_students: false,
        submission_rule: rule,
        assignment_stat: assignment_stat,
        allow_remarks: false,
        enable_test: false,
        tokens_per_period: 0,
        token_start_date: DateTime.now,
        token_period: 1
    )
  end
end
