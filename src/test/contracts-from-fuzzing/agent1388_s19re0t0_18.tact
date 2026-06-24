struct AllOpt {
  a: Int? = null;
  b: Bool? = null;
  c: String? = null;
  d: Address? = null;
  e: Cell? = null;
  f: Slice? = null;
}

contract OptAllDefaults {
  whole: AllOpt;

  init() {
    self.whole = AllOpt{};
  }
}
