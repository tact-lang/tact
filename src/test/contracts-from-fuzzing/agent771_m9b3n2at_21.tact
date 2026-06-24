contract ReorderedFields {
  a: Int = 1;
  nested: Nested;

  init() {
    self.a = 42;
    self.nested = Nested{x: 7};
  }
}

struct Nested {
  x: Int;
}
