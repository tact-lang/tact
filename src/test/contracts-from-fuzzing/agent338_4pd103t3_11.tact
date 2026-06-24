struct S1 {
  a: Int as uint8;
  b: Int as int16;
}

struct S2 {
  x: Int as int257;
  y: Int as uint64;
  nested: S1;
}

contract TestContract {
  data: S2;

  init() {
    self.data = S2{
      x: 5,
      y: 10,
      nested: S1{ a: 1, b: -20 }
    };
  }
}