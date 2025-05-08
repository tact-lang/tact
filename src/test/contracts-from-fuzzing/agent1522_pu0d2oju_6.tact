struct Complex {
  a: Int;
  b: Bool;
  c: Nested1;
  d: Nested2;
  e: String?;
}

struct Nested1 {
  x: Int;
  y: Int?;
  z: Leaf1;
}

struct Nested2 {
  q: Bool;
  r: Leaf2;
}

struct Leaf1 {
  foo: String;
}

struct Leaf2 {
  bar: Int;
}

contract CrossNested {
  state: Complex;
  init() {
    self.state = Complex{
      a: 1,
      b: true,
      c: Nested1{
        x: 10,
        y: null,
        z: Leaf1{foo:"ok"}
      },
      d: Nested2{
        q: false,
        r: Leaf2{bar: 99}
      },
      e: null
    };
  }
}