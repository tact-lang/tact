contract AllCoinSizes {
  normal: Int;
  asCoin: Int as coins;
  asU8: Int as uint8;
  asI128: Int as int128;
  asU251: Int as uint251;

  init() {
    self.normal = 100;
    self.asCoin = 1000;
    self.asU8 = 12;
    self.asI128 = -123456789;
    self.asU251 = 999999999999;
  }
}