struct Nested {
  a: Int;
  b: Bool;
  c: String;
}

contract TestContract {
  nested: Nested;

  init() {
    self.nested = Nested{
      a: 42,
      b: true,
      c: "test",
    };
  }
}