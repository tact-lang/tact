struct DeepMixedSerial {
  i1: Int as int1;
  i8: Int as int8;
  i64: Int as int64;
  u3: Int as uint3;
  u7: Int as uint7;
  u255: Int as uint255;
  s: String;
  b: Bool;
  o: Int?;
}

contract VariousSerializations {
  data: DeepMixedSerial;

  init() {
    self.data = DeepMixedSerial{
      i1: 0,
      i8: -20,
      i64: -789,
      u3: 7,
      u7: 55,
      u255: 999999,
      s: "x",
      b: true,
      o: null
    };
  }

  receive() {
    let _ = self.data.b;
  }
}
