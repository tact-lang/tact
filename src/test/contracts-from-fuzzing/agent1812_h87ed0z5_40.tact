// Explore serialization of Int with corner-case serialization widths
contract WeirdIntWidths {
  tiny: Int as int1 = 0;     // min serialized int
  bigsigned: Int as int257 = 1;
  tinyu: Int as uint1 = 1;  // min unsigned >0
  bigu: Int as uint256 = 1;
  mid: Int as int128 = -1;

  init() {
    self.tiny = 1;
    self.bigsigned = -1000;
    self.tinyu = 1;
    self.bigu = 55;
    self.mid = 10000;
  }
}