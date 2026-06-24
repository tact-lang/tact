struct SerialMixed {
  a: Int as uint8;
  b: Int;
  c: Int as int32;
}

contract MixedSerials {
  val: SerialMixed;

  init() {
    self.val = SerialMixed{ a: 1, b: 2, c: -3 };
  }
}