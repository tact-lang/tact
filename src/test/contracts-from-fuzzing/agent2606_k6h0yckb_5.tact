struct Deep {
  a: Int;
  b: Nested;
}

struct Nested {
  x: Int;
  y: Inner;
}

struct Inner {
  z: Int;
  w: Bool;
}

contract TestDeep {
  store: Deep;

  init() {
    self.store = Deep{
      a: 1,
      b: Nested{
        x: 2,
        y: Inner{ z: 3, w: true }
      }
    };
  }
}