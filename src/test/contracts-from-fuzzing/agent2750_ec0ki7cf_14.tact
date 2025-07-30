struct Tweak {
  a: Int as uint16;
  b: Int as uint64;
  c: Int as int8;
  d: Bool;
}

contract SerializedFields {
  data: Tweak;
  init() {
    self.data = Tweak {
      a: 42,
      b: 1000,
      c: -5,
      d: false
    };
  }
}
