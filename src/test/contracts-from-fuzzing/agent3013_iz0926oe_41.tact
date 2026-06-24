struct InnerOpt {
  x: Int?;
  y: String?;
}

contract OptionalMatrix {
  f1: InnerOpt?;
  f2: InnerOpt?;

  init() {
    self.f1 = null;
    self.f2 = null;
  }
}
