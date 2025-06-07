struct ManyOptional {
  a: Int?;
  b: Bool?;
  c: Address?;
  d: Slice?;
  e: String?;
  f: Cell?;
}

contract OptionalNested {
  opt: ManyOptional?;

  init() {
    self.opt = null;
  }
}