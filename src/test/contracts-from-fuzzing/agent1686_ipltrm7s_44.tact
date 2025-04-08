struct MixedSerial {
  x: Int as int64;
  y: Int;
  z: Int as uint32;
}

contract MixedSerialTest {
  data: MixedSerial;

  init() {
    self.data = MixedSerial{x:64,y:123,z:32};
  }
}