struct Person {
  id: Int;
  name: String = "anon";
  active: Bool = true;
}

contract TestContract {
  person_opt: Person?;
  init() {
    self.person_opt = Person{
      id: 123,
      name: "test",
      active: false
    };
  }
}