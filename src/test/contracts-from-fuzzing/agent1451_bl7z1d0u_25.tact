struct SerialTest {
  a: Int as uint8;
  b: Int as int16;
  c: Int as uint32;
  d: Int as int64;
}

contract SerializedFields {
  s: SerialTest;

  init() {
    self.s = SerialTest{
      a:5,
      b:-127,
      c:12345,
      d:-987654321
    };
  }
}
