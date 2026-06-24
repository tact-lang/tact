struct X {
  a: Int;
}

contract ManyX {
  x1: X;
  x2: X;
  x3: X;

  init() {
    self.x1 = X{a:1};
    self.x2 = X{a:2};
    self.x3 = X{a:3};
  }
}
