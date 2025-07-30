contract IntSerialization {
  val1: Int as int8; 
  val2: Int as uint8; 
  val3: Int as int128;
  val4: Int as uint128;

  init() {
    self.val1 = -5;
    self.val2 = 5;
    self.val3 = -123456789;
    self.val4 = 123456789;
  }
}