require('spec_helper')

  describe(List) do


  # describe("#id") do
  #   it("sets its ID when you save it") do
  #     list = List.new({:name => "Epicodus Stuff", :id => nil})
  #     list.save()
  #     expect(list.id()).to(be_an_instance_of(Fixnum))
  #   end
  # end


  # describe(".find") do
  #   it("returns a list by it's ID") do
  #     test_list = List.new({:name => 'Epicodus stuff', :id => nil})
  #     test_list.save()
  #     test_list2 = List.new({:name => "Home stuff", :id => nil})
  #     test_list2.save()
  #     expect(List.find(test_list2.id())).to(eq(test_list2))
  #   end
  # end

  describe("#tasks") do
    it("returns an array of tasks for that list") do
      test_list = List.create({:name => "Epicodus stuff"})
      test_task1 = Task.create({:description => "task1", :list_id => test_list.id()})
      test_task2 = Task.create({:description => "task2", :list_id => test_list.id()})
      expect(test_list.tasks()).to(eq([test_task1, test_task2]))
    end
  end

  describe("#update") do
    it("lets you update lists in the database") do
      list = List.create({:name => "Epicodus stuff"})
      list.update({:name => "Homework stuff"})
      expect(list.name()).to(eq("Homework stuff"))
    end
  end
end
