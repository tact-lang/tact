contract IntSerializationDefaults {
  x: Int as uint8 = 255;
  y: Int as int16 = -123;

  init() {
    self.x = 20;
    self.y = -20;
  }
}