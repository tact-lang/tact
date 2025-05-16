contract StringFields {
  shortStr: String;
  emptyStr: String;
  longStr: String;

  init() {
    self.shortStr = "a";
    self.emptyStr = "";
    self.longStr = "This is a longer string to test handling in storage";
  }
}