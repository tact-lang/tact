struct A {
  x: Int as uint8;
  y: Int as uint16;
}

struct B {
  a: A;
  z: Int as int64;
}

struct C {
  b: B;
  q: Int as uint32;
}

contract DeepAnnoTest {
  field: C;

  init() {
    self.field = C{
      b: B{
        a: A{x: 9, y: 999},
        z: -123456
      },
      q: 42
    };
  }
}