struct Nested {
  a: Int;
  b: Int?;
  c: String;
  d: Bool?;
  e: String?;
}

contract LargeNestedFields {
  data: Nested;

  init() {
    self.data = Nested{
      a: 1,
      b: null,
      c: "hi",
      d: true,
      e: null,
    };
  }
}