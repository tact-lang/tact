struct InnerA {
  foo: Int;
}

struct InnerB {
  bar: Bool;
}

contract MultiInner {
  a: InnerA;
  b: InnerB;
  n: Int;

  init() {
    self.a=InnerA{foo:5};
    self.b=InnerB{bar:true};
    self.n=7;
  }
}