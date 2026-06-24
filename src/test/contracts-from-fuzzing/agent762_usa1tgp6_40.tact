struct OptAddrStr {
  x: Address?;
  y: String?;
}

contract OptionalAddrStr {
  s: OptAddrStr;

  init() {
    self.s = OptAddrStr { x:null, y:null };
  }
}