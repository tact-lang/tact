struct Complex {
  num: Int;
  flag: Bool;
  name: String;
  optionalInt: Int?;
  nested: Nested;
}

struct Nested {
  field: Bool;
  optStr: String?;
}

contract TestContract {
  store: Complex;

  init() {
    self.store = Complex{
      num: 7,
      flag: true,
      name: "name",
      optionalInt: null,
      nested: Nested{ field: false, optStr: null }
    };
  }
}