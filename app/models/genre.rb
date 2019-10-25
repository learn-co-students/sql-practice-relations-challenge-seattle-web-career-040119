require "pry"
class Genre
  include Databaseable::InstanceMethods
  extend Databaseable::ClassMethods
  ATTRIBUTES = {
    id: "INTEGER PRIMARY KEY",
    name: "TEXT",
  }

  attr_accessor(*self.public_attributes)
  attr_reader :id

  def movies(genre)
    sql = <<-SQL
    SELECT * FROM movies
    WHERE genre = ?
    SQL
    x = self.class.db.execute(sql, self.name)
    binding.pry
  end


end

# puts movies