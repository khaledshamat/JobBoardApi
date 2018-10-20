class CreateJobApplications < ActiveRecord::Migration[5.2]
  def change
    create_table :job_applications do |t|
      t.text :data
      t.boolean :status
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
