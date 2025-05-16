struct SerialTest {
  x: Int as int64;
  y: Int as uint32;
  z: Bool;
}

contract SerialContract {
  val: SerialTest;

  init() {
    self.val = SerialTest{
      x: 100, y: 200, z: true
    };
  }
}