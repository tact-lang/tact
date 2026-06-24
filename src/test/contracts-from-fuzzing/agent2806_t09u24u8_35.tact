contract OptionalDefaults {
  o1: Int? = 7;
  o2: Bool? = false;
  o3: String? = null;

  init() {
    self.o1 = null;
    self.o2 = true;
    self.o3 = null;
  }
}