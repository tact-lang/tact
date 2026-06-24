struct Nested {
  a: Int;
  b: Int?;
  c: String;
}

contract TestContract {
  data: Nested;

  init() {
    self.data = Nested{ a: 1, b: null, c: "abc" };
  }
}
