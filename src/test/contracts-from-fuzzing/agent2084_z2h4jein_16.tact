struct X {
  foo: Int;
}

struct Y {
  bar: Bool;
}

contract Multi {
  xx: X;
  yy: Y;

  init() {
    self.xx = X{foo: 12};
    self.yy = Y{bar: false};
  }
}