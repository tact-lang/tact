struct Nested {
  a: Int;
  b: Int?;
  c: Inner;
}

struct Inner {
  x: Int;
  y: Bool;
}

contract TestContract {
  field1: Int = 1;
  field2: Bool = true;
  field3: String = "ok";
  nested: Nested;

  init() {
    self.nested = Nested{ a: 10, b: null, c: Inner{ x: 5, y: false } };
  }
}