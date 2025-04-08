struct ChainA {
  next: ChainB?;
}
struct ChainB {
  next: ChainC?;
}
struct ChainC {
  value: Int?;
}

contract OptChain {
  data: ChainA;

  init() {
    self.data = ChainA{ next: ChainB{ next: ChainC{ value: 42 } } };
  }
}