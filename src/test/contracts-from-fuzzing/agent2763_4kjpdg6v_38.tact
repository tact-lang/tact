struct OptionalPerson {
  name: String?;
  age: Int?;
  address: Address?;
}

contract NullablePerson {
  p: OptionalPerson;

  init() {
    self.p = OptionalPerson {
      name: null,
      age: null,
      address: null,
    };
  }
}