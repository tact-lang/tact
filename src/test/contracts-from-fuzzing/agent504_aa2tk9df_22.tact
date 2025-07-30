struct SerializeInt {
  si1: Int as int16;
  si2: Int as int32;
  ui1: Int as uint16;
  ui2: Int as uint32;
}

contract SerializeIntTest {
  v: SerializeInt;
  init() {
    self.v = SerializeInt{
      si1: -12345,
      si2: -1234567,
      ui1: 54321,
      ui2: 1234567
    };
  }
}