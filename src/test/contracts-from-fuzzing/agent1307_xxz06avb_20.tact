contract EmptyStringsOpt {
  s1: String? = null;
  s2: String? = null;

  init() {
    self.s1 = "";
    self.s2 = "text";
  }
}