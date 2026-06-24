struct Data {
  a: Int as uint8;
  b: Int as int16;
  c: Int as uint32;
  d: Int as int64;
}

contract SerialOpts {
  v: Data;

  init() {
    self.v = Data{a: 255, b: -1000, c: 123456, d: 987654321};
  }
}