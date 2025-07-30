struct Serialization {
  smallInt: Int as uint4;  // 4-bit unsigned
  largeInt: Int;          // default 257-bit signed
}

contract MixedSerializationContract {
  s: Serialization;

  init() {
    self.s = Serialization{
      smallInt: 7,
      largeInt: 1234567890
    };
  }
}