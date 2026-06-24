struct Person {
  name: String = "Alice";
  age: Int?;
}

contract NestedStructField {
  person: Person;
  init() {
    self.person = Person{};
  }
}