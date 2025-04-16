struct WithManyBoolDefaults {
  a: Bool = true;
  b: Bool = false;
  c: Bool = true;
  d: Bool = false;
}

contract BoolDefaultsCtr {
  bb: WithManyBoolDefaults;

  init() {
    self.bb = WithManyBoolDefaults{};
  }
}
