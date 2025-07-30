struct Deep {
  x: Int;
  y: Int?;
  sub: Inner;
}

struct Inner {
  a: Int;
  b: Int?;
}

contract TestContract {
  d: Deep;
  init() {
    self.d = Deep{x: 1, y: null, sub: Inner{a: 7, b: 9}};
  }
}