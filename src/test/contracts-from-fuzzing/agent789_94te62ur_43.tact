struct Complex {
  a: Int;
  b: Bool?;
  c: Inner1;
}

struct Inner1 {
  d: Int;
  e: Bool?;
  f: String?;
  g: Inner2;
}

struct Inner2 {
  h: Int;
  i: Bool;
}

contract ComplexTest {
  s: Complex;

  init() {
    self.s = Complex {
      a: 1,
      b: null,
      c: Inner1 {
        d: 2,
        e: null,
        f: null,
        g: Inner2 { h:3, i:true }
      }
    };
  }
}
