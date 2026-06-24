struct SerialTest {
  a: Int as int8;
  b: Int as uint16;
  c: Int as coins;
}

contract SerializeCheck {
  data: SerialTest;

  init() {
    self.data = SerialTest{
      a: 4,
      b: 255,
      c: 1000000000
    };
  }
}
