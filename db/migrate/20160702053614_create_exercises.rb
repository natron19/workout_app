class CreateExercises < ActiveRecord::Migration
  def change
    create_table :exercises do |t|
      t.references :user, index: true, foreign_key: true
      t.integer :duration_in_min
      t.text :workout
      t.date :workout_date

      t.timestamps null: false
    end
  end
end
