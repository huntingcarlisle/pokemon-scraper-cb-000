class Pokemon
  attr_accessor :id, :name, :type, :db
  
  def initialize(id:, name:, type:, db:)
    @id = id
    @name = name
    @type = type
    @db = db
  end
  
  def self.save(name, type, db)
    db.execute("INSERT INTO pokemon (name, type) VALUES (?, ?)", name, type)
  end
  
  def self.find(id, db)
    table_data = db.execute("SELECT * FROM pokemon WHERE id = ?", id)[0]
    return self.new(id: id, name: table_data[1], type: table_data[2], db: db)
  end
  
end
