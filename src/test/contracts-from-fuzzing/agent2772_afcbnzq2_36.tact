struct SOptAddr {
  x: Address?;
}

contract TestSOptAddr {
  s: SOptAddr;

  init() {
    self.s = SOptAddr{x:null};
  }
}
