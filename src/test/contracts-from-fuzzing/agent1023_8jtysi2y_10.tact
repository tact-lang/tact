struct Packed {
  i1: Int as uint1;
  i7: Int as uint7;
  i13: Int as int13;
  i31: Int as int31;
  flag: Bool;
}

contract BitPacked {
  p: Packed;

  init() {
    self.p = Packed{
      i1: 1,
      i7: 50,
      i13: -1234,
      i31: 1234567890,
      flag: true
    };
  }
}
