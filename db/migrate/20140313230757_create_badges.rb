class CreateBadges < ActiveRecord::Migration[5.0]
  def change
    create_table :badges do |t|
      t.string :code
      t.string :category
      t.string :title

      t.timestamps
    end

    Badge.create code: 'paidmore', category: 'Generosity', title: 'Paid More than Minimum'
  end
end
