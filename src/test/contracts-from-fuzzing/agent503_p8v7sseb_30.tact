struct Deep {
  z: Int = 9;
}

struct Mid {
  d: Deep = Deep{};
}

struct Top {
  m: Mid = Mid{};
}

contract NestedDefaultsChain {
  t: Top = Top{};

  init() {
    self.t = Top{};
  }
}
