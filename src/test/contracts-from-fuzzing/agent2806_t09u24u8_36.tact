contract NullableMix {
  aa: Int?;
  bb: Bool = true;
  cc: String?;

  init() {
    self.aa = null;
    self.bb = false;
    self.cc = "cc";
  }
}