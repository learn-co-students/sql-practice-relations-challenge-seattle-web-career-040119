class Movie
  include Databaseable::InstanceMethods
  extend Databaseable::ClassMethods

  ATTRIBUTES = {
    id: "INTEGER PRIMARY KEY",
    title: "TEXT",
    release_year: "INTEGER"
    }

  attr_accessor(*self.public_attributes)
  attr_reader :id

  def self.by_year(year)
    sql = <<-SQL
    SELECT title FROM movies
    WHERE release_year = ?
    SQL
    p self.db.execute(sql, year).flatten
    # binding.pry
  end

  def genres
    sql = <<-SQL
    SELECT genre FROM movies
    WHERE movie = ?
    SQL
    binding.pry
     x =self.class.db.execute(sql).flatten
     binding.pry
  end


end
