struct MixedSerial {
  x: Int as uint8;
  y: Int?;
  z: Bool?;
  s: String;
}

contract PersistSerialOpt {
  m: MixedSerial;

  init() {
    self.m = MixedSerial{
      x: 200,
      y: null,
      z: true,
      s: "hello"
    };
  }
}
