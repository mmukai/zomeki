class CreateGpArticleCategoryTypes < ActiveRecord::Migration
  def change
    create_table :gp_article_category_types do |t|
      t.integer    :unid
      t.references :concept
      t.references :content

      t.string     :state
      t.string     :name
      t.string     :title
      t.integer    :sort_no

      t.timestamps
    end
  end
end
