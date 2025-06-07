struct SerialTest {
  a: Int as int64;
  b: Int as uint32;
  c: Bool;
  d: Int;
}

contract SerializationCheck {
  x: SerialTest;

  init() {
    self.x = SerialTest{
      a: -7,
      b: 123456,
      c: true,
      d: 42
    };
  }
}
