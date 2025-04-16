struct Name {
  value: String;
}

struct Person {
  name: Name;
  age: Int;
  address: Address;
}

contract DeepPerson {
  p: Person;

  init() {
    self.p = Person{
      name: Name{ value: "Alice" },
      age: 30,
      address: myAddress(),
    };
  }
}