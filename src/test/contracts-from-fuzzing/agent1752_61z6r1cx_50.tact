contract OnlyBoolFields {
  f1: Bool;
  f2: Bool;
  f3: Bool;

  init() {
    self.f1 = true;
    self.f2 = false;
    self.f3 = true;
  }
}