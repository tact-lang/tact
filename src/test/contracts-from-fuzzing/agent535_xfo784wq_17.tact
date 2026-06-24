contract OptionalDefaults {
  val1: Int? = null;
  val2: Bool? = null;
  val3: Address? = null;

  init() {
    self.val1 = null;
    self.val2 = null;
    self.val3 = null;
  }
}