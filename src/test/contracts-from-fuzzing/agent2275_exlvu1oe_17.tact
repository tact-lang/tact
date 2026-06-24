struct NestA {
  x: Int;
}

struct NestB {
  y: NestA;
}

struct NestC {
  z: NestB;
}

contract InitNoDefaults {
  n: NestC;
  init() {
    self.n = NestC{ z: NestB{ y: NestA{ x: 1 } } };
  }
}