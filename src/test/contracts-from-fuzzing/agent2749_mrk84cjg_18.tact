contract StringFields {
  str1: String;
  str2: String?;

  init() {
    self.str1 = "abc";
    self.str2 = null;
  }
}