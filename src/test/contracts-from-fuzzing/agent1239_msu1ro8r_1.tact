struct Nested {
  a: Int;
  b: Int?;
  c: String;
  d: Bool?;
}

contract DeepStructContract {
  nestedField: Nested;
  simpleInt: Int;

  init() {
    self.simpleInt = 7;
    self.nestedField = Nested{
      a: 1,
      b: null,
      c: "test",
      d: true
    };
  }
}