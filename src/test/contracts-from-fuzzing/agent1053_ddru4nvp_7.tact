struct DefS {
  x: Int = 1;
  y: Bool = false;
}

contract StructDefaults {
  data: DefS;

  init() {
    self.data = DefS{};
  }
}