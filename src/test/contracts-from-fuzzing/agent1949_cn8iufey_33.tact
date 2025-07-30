contract OnlyOptionals {
  f1: Int?;
  f2: Bool?;
  f3: String?;
  f4: Address?;
  f5: Cell?;
  f6: Builder?;
  f7: Slice?;

  init() {
    self.f1 = null;
    self.f2 = null;
    self.f3 = null;
    self.f4 = null;
    self.f5 = null;
    self.f6 = null;
    self.f7 = null;
  }
}
