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
    SELECT * FROM moviegenres
    WHERE genre = ?
    SQL
    self.class.db.execute(sql, genre)
  end


end

puts movies