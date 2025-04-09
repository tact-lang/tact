struct MultiOptSer {
  a: Int? as uint4;
  b: Bool?;
  c: Int? as uint8;
}

contract OptSerial {
  val: MultiOptSer;

  init() {
    self.val = MultiOptSer{
      a: null,
      b: null,
      c: null
    };
  }
}
