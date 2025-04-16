struct ChainA {
  val: Int?;
}
struct ChainB {
  nested: ChainA?;
}
struct ChainC {
  nested: ChainB?;
}
contract OptNested {
  data: ChainC;

  init() {
    self.data = ChainC{ nested: ChainB{ nested: ChainA{ val: null } } };
  }
}
