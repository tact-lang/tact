struct Complex {
  a: Int;
  b: Bool;
  c: Int?;
  d: Bool?;
  nested: Nested;
}

struct Nested {
  x: Int as uint32;
  y: Int as int64;
}

contract TestContract {
  s: Complex;

  init() {
    self.s = Complex{
      a: 1,
      b: true,
      c: null,
      d: false,
      nested: Nested{ x:123, y:-456 }
    };
  }
}