contract SerializedTopLevel {
  a: Int as uint8;
  b: Int as int32;

  init() {
    self.a = 12;
    self.b = -123456;
  }
}
