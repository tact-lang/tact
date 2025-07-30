contract MixTypesOpt {
  a: Int? = null;
  b: String? = null;
  c: Bool? = null;
  d: Slice?;

  init() {
    self.d = emptyCell().asSlice();
  }
}