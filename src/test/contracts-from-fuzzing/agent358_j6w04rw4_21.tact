struct A {
  x: Int;
}

contract ArrayLike {
  f1: A;
  f2: A;
  f3: A;
  f4: A;
  f5: A;

  init() {
    self.f1 = A{ x: 1 };
    self.f2 = A{ x: 2 };
    self.f3 = A{ x: 3 };
    self.f4 = A{ x: 4 };
    self.f5 = A{ x: 5 };
  }
}