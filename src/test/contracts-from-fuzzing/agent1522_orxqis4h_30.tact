struct MixSer {
  a: Int as uint4;
  b: Bool;
  c: Int? as uint16;
  d: Bool?;
}

contract MixedSerialization {
  s: MixSer;

  init() {
    self.s = MixSer{
      a: 9,
      b: true,
      c: null,
      d: false,
    };
  }

  receive() {
    let _ = self.s;
  }
}