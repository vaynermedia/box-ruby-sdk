require 'box/item'

describe Box::Item do
  class Fake < Box::Item
    def get_info(*args); { :lol => 'fake' }; end
  end

  def fake(options = {})
    Fake.new(nil, options)
  end

  it "has info accessors" do
    item = fake(:name => 'myname', :philip => 'king')
    item.name.should == 'myname'
    item.philip.should == 'king'
  end

  it "lazy-loads info" do
    item = fake
    item.data[:lol].should == nil
    item.lol.should == 'fake'
    item.data[:lol].should == 'fake'
  end
end
