struct Nested {
  inner1: Int;
  inner2: Bool;
}

contract TestContract {
  x: Int = 1;
  y: Bool = true;
  s: Nested = Nested{ inner1: 42, inner2: false };

  init() {
    self.x = 10;
    self.y = false;
    self.s = Nested{ inner1: 99, inner2: true };
  }
}