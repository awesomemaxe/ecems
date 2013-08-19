class RenameOldtableToNewtable< ActiveRecord::Migration
    def self.up
        rename_table :students, :msstudents
        add_column :msstudents, :email, :string
    end 
    def self.down
        rename_table :msstudents, :students
    end
 end