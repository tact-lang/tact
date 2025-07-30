// contract with complex optional + default + serialization
struct S {
  a: Int? = null;
  b: Bool = true;
  c: Int as uint32;
}

contract OptDefSerial {
  f: S;

  init() {
    self.f = S{
      a: null,
      b: false,
      c: 42,
    };
  }
}