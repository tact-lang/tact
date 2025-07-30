contract BoolVariants {
  f1: Bool;
  f2: Bool?;
  f3: Bool;
  f4: Bool?;

  init() {
    self.f1 = true;
    self.f2 = null;
    self.f3 = false;
    self.f4 = true;
  }
}