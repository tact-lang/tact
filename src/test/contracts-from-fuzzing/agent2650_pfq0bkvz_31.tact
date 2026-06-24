contract HasCoinFormats {
  amount: Int as coins;
  val1: Int as uint8;
  val2: Int as int128;

  init() {
    self.amount = ton("1");
    self.val1 = 255;
    self.val2 = -100000;
  }
}