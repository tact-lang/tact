contract SerializedIntOptional {
  small: Int as uint8;
  maybe: Int?;

  init() {
    self.small = 7;
    self.maybe = null;
  }
}