struct Complex {
  inner1: Inner1;
  inner2: Inner2;
}

struct Inner1 {
  a: Int;
  b: Bool;
}

struct Inner2 {
  x: Int?;
  y: Bool?;
}

contract ComplexNested {
  state: Complex;

  init() {
    self.state = Complex{
      inner1: Inner1{ a:1, b:true },
      inner2: Inner2{ x: null, y: null }
    };
  }
}
