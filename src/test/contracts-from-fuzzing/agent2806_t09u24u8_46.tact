struct SerialTest {
  a: Int as uint8;
  b: Int as uint16;
  c: Int as int32;
}

contract SerialContract {
  val: SerialTest;

  init() {
    self.val = SerialTest{a:5, b:6, c:7};
  }
}