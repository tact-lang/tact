struct Opts {
  a: Int?;
  b: Bool?;
  c: String?;
  d: Address?;
  e: Cell?;
  f: Slice?;
}

contract OptionNest {
  val: Opts?;
  init() {
    self.val = null;
  }
}