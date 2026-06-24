struct OptionalMany {
  s: String?;
  n: Int?;
  b: Bool?;
  c: Cell?;
  a: Address?;
}

contract MultiOptional {
  s: String?;
  n: Int?;
  nestedOpt: OptionalMany?;

  init() {
    self.s = null;
    self.n = null;
    self.nestedOpt = null;
  }
}
