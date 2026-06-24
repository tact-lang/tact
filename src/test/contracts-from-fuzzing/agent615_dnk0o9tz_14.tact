contract DefaultsAndOverrides {
  a: Int = 5;
  b: Bool;
  c: String = "hello";
  d: Address;

  init() {
    self.b = true;
    self.d = myAddress();
    self.c = "override";
  }
}