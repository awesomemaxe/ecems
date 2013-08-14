class CreateStudents < ActiveRecord::Migration
  def change
    create_table :students do |t|
      t.string :UID
      t.string :last_name
      t.string :first_name
      t.string :degree
      t.string :specialization
      t.string :cohort

      t.timestamps
    end
  end
end
