struct Nested {
  a: Int;
  b: Bool;
  c: String?;
}

contract TestContract {
  x: Nested;

  init() {
    self.x = Nested{
      a: 1,
      b: true,
      c: "ok"
    };
  }
}