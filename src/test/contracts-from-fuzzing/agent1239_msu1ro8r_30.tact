contract OptionalLongStrings {
  s1: String?;
  s2: String?;
  s3: String?;

  init() {
    self.s1 = "longstring1";
    self.s2 = null;
    self.s3 = "anotherlongstring";
  }
}