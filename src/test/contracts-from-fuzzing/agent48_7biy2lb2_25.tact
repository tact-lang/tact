struct S {
    one: Int?;
    two: Int?;
}

contract TestContract {
  s: S;
  x: Int;
  y: Int?;

  init() {
    self.s = S { one: null, two: 2 };
    self.x = 42;
    self.y = null;
  }
}