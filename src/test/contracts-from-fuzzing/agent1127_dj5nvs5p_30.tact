struct InnerMost {
  x: Int;
}
struct Middle {
  im: InnerMost;
}
struct Outer {
  m: Middle;
}

contract NestedAssigns {
  f: Outer;

  init() {
    self.f = Outer{ m: Middle{ im: InnerMost{ x: 3 } } };
  }

  receive() {
    self.f.m.im.x = 555;
  }
}
