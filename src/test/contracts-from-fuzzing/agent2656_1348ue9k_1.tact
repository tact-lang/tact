struct Person {
  name: String;
  age: Int as uint8;
  is_member: Bool;
}

contract SimpleStorage {
  person: Person;
  
  init() {
    self.person = Person{
      name: "Alice",
      age: 30,
      is_member: true,
    };
  }
}
