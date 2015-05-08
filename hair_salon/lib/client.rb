class Client
attr_reader(:name, :stylist_id, :id)

  define_method(:initialize) do |attributes|
    @name = attributes.fetch(:name)
    @stylist_id = attributes.fetch(:stylist_id).to_i()
    @id = attributes.fetch(:id).to_i
  end

  define_singleton_method(:all) do
    returned_clients = DB.exec("SELECT * FROM clients;")
    clients = []
    returned_clients.each() do |client|
      name = client.fetch('name')
      stylist_id = client.fetch('stylist_id')
      id = client.fetch('id')
      clients.push(Client.new({:name => name, :stylist_id => stylist_id, :id => id}))
    end
    clients
  end

  define_singleton_method(:find) do |id|
    @id = id
    returned_clients = DB.exec("SELECT * FROM clients WHERE id = '#{id}';")
    @name = returned_clients.first().fetch('name')
    @stylist_id = returned_clients.first().fetch('stylist_id')
    Client.new({:name => @name, :stylist_id => @stylist_id, :id => @id})
  end

  define_method(:save) do
    result = DB.exec("INSERT INTO clients (name, stylist_id) VALUES ('#{@name}', '#{@stylist_id}') RETURNING id;")
    @id = result.first().fetch('id').to_i()
  end

  define_method(:==) do |another_client|
    self.name().==(another_client.name()).&(self.id().==(another_client.id())).&(self.stylist_id().==(another_client.stylist_id()))
  end

  define_method(:update) do |attributes|
    @name = attributes.fetch(:name, @name)
    @id = self.id()
    DB.exec("UPDATE clients SET name = '#{@name}' WHERE id = #{@id};")
  end

  define_method(:delete) do
    DB.exec("DELETE FROM clients WHERE id = #{self.id()};")
  end
end
