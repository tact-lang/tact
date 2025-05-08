struct ManyOpts {
  b1: Bool?; b2: Bool?; b3: Bool?; b4: Bool?; b5: Bool?;
  b6: Bool?; b7: Bool?; b8: Bool?; b9: Bool?; b10: Bool?;
}

contract OptBools {
  data: ManyOpts;
  init() {
    self.data = ManyOpts{};
  }
}