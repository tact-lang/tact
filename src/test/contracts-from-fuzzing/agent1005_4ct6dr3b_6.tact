struct Inner {
  a: Int;
  b: Bool;
}

struct Middle {
  c: Inner;
  d: Int;
}

struct Outer {
  e: Middle;
  f: String;
}

contract TestComplex {
  nested: Outer;

  init() {
    self.nested = Outer{
      e: Middle{ c: Inner{a: 5, b: false}, d: 10 },
      f: "hi"
    };
  }
}