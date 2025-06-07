struct IntFields {
  a: Int as uint8;
  b: Int as int16;
}

contract TestContract {
  s: IntFields;

  init() {
    self.s = IntFields{ a: 10, b: -100 };
  }
}