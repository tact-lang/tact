contract SerialFormats {
  iint: Int as int128;
  uint: Int as uint200;
  tiny: Int as uint1;

  init() {
    self.iint = 100000;
    self.uint = 500000;
    self.tiny = 1;
  }
}