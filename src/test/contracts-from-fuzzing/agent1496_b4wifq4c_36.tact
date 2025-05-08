contract OptionalStringInt {
  text: String?;
  num: Int?;

  init() {
    self.text = null;
    self.num = 42;
  }
}