struct Inner1 {
  a: Int = 1;
  b: Bool?;
}

struct Inner2 {
  c: String;
  d: Int?;
}

struct Outer {
  i1: Inner1;
  i2: Inner2;
  flag: Bool = false;
}

contract ComplexFields {
  state: Outer;

  init() {
    self.state = Outer{
      i1: Inner1 { a: 5, b: false },
      i2: Inner2 { c: "ok", d: 77 },
      flag: true
    };
  }
}
