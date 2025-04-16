struct SerializeTest {
  smallInt: Int as uint8;
  bigInt: Int as int64;
  normalInt: Int;
  flag: Bool;
}

contract TestSerialization {
  s: SerializeTest;

  init() {
    self.s = SerializeTest{
      smallInt: 12,
      bigInt: -1234567,
      normalInt: 42,
      flag: true
    };
  }
}
