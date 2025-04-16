struct TinyNested {
  x: Int;
}

struct Middle {
  y: TinyNested;
}

struct Outer {
  z: Middle;
}

contract TinyNest {
  root: Outer;

  init() {
    self.root = Outer{ z: Middle{ y: TinyNested{ x: 7 } } };
  }
}
