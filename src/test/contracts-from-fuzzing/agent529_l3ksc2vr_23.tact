struct InnerOpt {
  x: Int?;
  y: Bool?;
}

contract CrossDefaults {
  v1: InnerOpt = InnerOpt{};
  v2: InnerOpt;

  init() {
    self.v2 = InnerOpt{ x: 5, y: true};
  }
}