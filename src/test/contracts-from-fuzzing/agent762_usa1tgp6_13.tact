contract OptionalBoolIntString {
  flag: Bool?;
  number: Int?;
  text: String?;

  init() {
    self.flag = null;
    self.number = null;
    self.text = null;
  }
}