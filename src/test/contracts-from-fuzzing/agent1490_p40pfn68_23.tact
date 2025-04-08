struct SerFormats {
  i16: Int as int16;
  u4: Int as uint4;
  coinsVal: Int as coins;
  big: Int as int257;
}

contract StructSerialization {
  data: SerFormats;

  init() {
    self.data = SerFormats{
      i16: 100,
      u4: 5,
      coinsVal: ton("1"),
      big: 9000000
    };
  }
}