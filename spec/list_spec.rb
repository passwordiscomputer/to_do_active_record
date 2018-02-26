require('spec_helper')

describe(List) do
  describe("#tasks") do
    it("tells which tasks are in it") do
      test_list = List.create({:name => "list"})
      test_task1 = Task.create({:description => "task1", :list_id => test_list.id})
      test_task2 = Task.create({:description => "task2", :list_id => test_list.id})
     expect(test_list.tasks()).to(eq([test_task1, test_task2]))
    end
  end
  describe("#create") do
    it("adds a new list to the database") do
      test_list = List.create({:name => "list"})
      expect(List.all).to(eq([test_list]))
    end
  end
  describe('#update') do
    it("updates info about list in database") do
      test_list = List.create(name: "list")
      test_list.update(:name => "new list")
      expect(test_list.name).to(eq("new list"))
    end
  end
  describe('#find')do
    it("finds a list by a particular parameter") do
      test_list = List.create(name: "list")
      # found_list = List.find_by(name: "list")
      expect(List.find_by(name: "list")).to(eq(test_list))
    end
  end
end
