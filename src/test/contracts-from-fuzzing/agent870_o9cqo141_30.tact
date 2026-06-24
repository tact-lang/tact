struct OptStringAddr {
  s: String?;
  a: Address?;
}

contract OptionalComplex {
  data: OptStringAddr;

  init() {
    self.data = OptStringAddr{ s:null, a:null };
  }
}