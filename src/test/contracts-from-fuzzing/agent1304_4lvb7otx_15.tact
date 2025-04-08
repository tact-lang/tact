contract MinMaxSerial {
  minU: Int as uint1;
  maxI: Int as int257;

  init() {
    self.minU = 1;
    self.maxI = 42;
  }
}