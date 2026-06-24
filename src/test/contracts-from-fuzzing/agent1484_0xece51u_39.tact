contract EdgeSerializationSize {
  a256: Int as int256;
  a255: Int as int255;
  u256: Int as uint256;
  u255: Int as uint255;

  init() {
    self.a256 = -1;
    self.a255 = -1;
    self.u256 = 1;
    self.u255 = 1;
  }
}