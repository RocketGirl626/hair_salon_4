require('spec_helper')

describe(Client) do

  describe('#name') do
    it('will return the name of the client') do
      client = Client.new({:name => "Sarah", :stylist_id => 1, :id => nil})
      expect(client.name()).to(eq("Sarah"))
    end
  end

  describe('#stylist_id') do
    it('will return the stylist_id of the client') do
      client = Client.new({:name => "Sarah", :stylist_id => 1, :id => nil})
      expect(client.stylist_id()).to(eq(1))
    end
  end

  describe('#id') do
    it('will return the id of a client') do
      client = Client.new({:name => "Sarah", :stylist_id => 1, :id => nil})
      expect(client.id()).to(be_an_instance_of(Fixnum))
    end
  end

  describe ('.all') do
    it('will return empty at first') do
      expect(Client.all()).to(eq([]))
    end
  end

  describe('.find') do
    it('return a client by its id number') do
      client = Client.new({:name => "Sarah", :stylist_id => 1, :id => nil})
      client.save()
      client2 = Client.new({:name => "Stephen", :stylist_id => 2, :id => nil})
      client2.save()
      expect(Client.find(client.id())).to(eq(client))
    end
  end

  describe('#save') do
    it('saves a client to the clients table') do
      client = Client.new({:name => "Sarah", :stylist_id => 1, :id => nil})
      client.save()
      expect(Client.all()).to(eq([client]))
    end
  end

  describe('#==') do
    it('is the same client if it has the same name, stylist_id, and id') do
      client = Client.new({:name => "Sarah", :stylist_id => 1, :id => nil})
      client2 = Client.new({:name => "Sarah", :stylist_id => 1, :id => nil})
      expect(client).to(eq(client2))
    end
  end

  describe('#update') do
    it('lets you update client in the database') do
      client = Client.new({:name => "Sarah", :stylist_id => 1, :id => nil})
      client.save()
      client.update({:name => 'Stephen'})
      expect(client.name()).to(eq('Stephen'))
    end
  end

  describe('#delete') do
    it('lets you delete a client from the database') do
      client = Client.new({:name => "Sarah", :stylist_id => 1, :id => nil})
      client.save()
      client2 = Client.new({:name => "Stephen", :stylist_id => 2, :id => nil})
      client2.save()
      client.delete()
      expect(Client.all()).to(eq([client2]))
    end
  end


end
