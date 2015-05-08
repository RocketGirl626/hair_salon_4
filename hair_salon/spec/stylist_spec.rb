require('spec_helper')

describe(Stylist) do

  describe('#name') do
    it('returns the name of the stylist') do
      test_stylist = Stylist.new({:name => "Fifi", :id => nil})
      expect(test_stylist.name()).to(eq("Fifi"))
    end
  end

  describe('#id') do
    it('returns the id of the stylist') do
      test_stylist = Stylist.new({:name => "Fifi", :id => nil})
      expect(test_stylist.id()).to(be_an_instance_of(Fixnum))
    end
  end

  describe ('.all') do
    it('will return empty at first') do
      expect(Stylist.all()).to(eq([]))
    end
  end

  describe('.find') do
    it('will return a stylist by its id number') do
      test_stylist = Stylist.new({:name => 'Fifi', :id => nil})
      test_stylist.save()
      test_stylist2 = Stylist.new({:name => 'Pierre', :id => nil})
      test_stylist2.save()
      expect(Stylist.find(test_stylist2.id())).to(eq(test_stylist2))
    end
  end

  describe('#save') do
    it('saves a stylist to the stylists table') do
      test_stylist = Stylist.new({:name => 'Fifi', :id => nil})
      test_stylist.save()
      expect(Stylist.all()).to(eq([test_stylist]))
    end
  end

  describe('#==') do
    it('is the same stylist if it has the same name and id') do
      test_stylist = Stylist.new({:name => "Fifi", :id => nil})
      test_stylist2 = Stylist.new({:name => "Fifi", :id => nil})
      expect(test_stylist).to(eq(test_stylist2))
    end
  end

  describe('#update') do
    it('lets you update stylists in the database') do
      test_stylist = Stylist.new({:name => 'Fifi', :id => nil})
      test_stylist.save()
      test_stylist.update({:name => 'Pierre'})
      expect(test_stylist.name()).to(eq('Pierre'))
    end
  end

  describe('#delete') do
    it('lets you delete a stylist from the database') do
      test_stylist = Stylist.new({:name => 'Fifi', :id => nil})
      test_stylist.save()
      test_stylist2 = Stylist.new({:name => 'Fifi', :id => nil})
      test_stylist2.save()
      test_stylist.delete()
      expect(Stylist.all()).to(eq([test_stylist2]))
    end
  end

  describe("#clients") do
    it("returns an array of clients for that stylist") do
      test_stylist = Stylist.new({:name => 'Fifi', :id => nil})
      test_stylist.save()
      client = Client.new({:name => "Sarah", :stylist_id => 1, :id => nil})
      client.save()
      client2 = Client.new({:name => "Stephen", :stylist_id => 2, :id => nil})
      client2.save()
      expect(test_stylist.clients()).to(eq([client, client2]))
    end
  end


end
