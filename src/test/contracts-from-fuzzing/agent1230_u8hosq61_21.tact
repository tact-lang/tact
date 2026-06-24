struct ManyOpts {
  a: Int?;
  b: Bool?;
  c: String?;
  d: Address?;
  e: Cell?;
  f: Int as uint8;
  g: Int as int32;
}

contract OptionsMix {
  s: ManyOpts;
  
  init() {
    self.s = ManyOpts{ f:1, g:-1 };
  }
}