struct Inner {
  x: Int;
  y: Bool?;
}

struct Middle {
  m: Inner;
  z: Bool;
}

contract NestedOptionals {
  data: Middle;

  init() {
    self.data = Middle{
      m: Inner{ x: 100, y: null },
      z: true
    };
  }
}