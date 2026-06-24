contract FieldOrder {
  one: Int as uint8;
  two: Int as int8;
  three: Int;
  four: String;
  five: Bool;

  init() {
    self.five = false;
    self.three = 100;
    self.one = 255;
    self.two = -120;
    self.four = "last";
  }
}