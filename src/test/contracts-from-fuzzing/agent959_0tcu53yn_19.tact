contract OnlyStrings {
  s1: String;
  s2: String?;

  init() {
    self.s1 = "abc";
    self.s2 = null;
  }
}