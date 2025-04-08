struct ChainA {
  b: ChainB;
}
struct ChainB {
  c: ChainC;
}
struct ChainC {
  val: Int;
}

contract Test {
  chain: ChainA;

  init() {
    self.chain = ChainA{
      b: ChainB{
        c: ChainC{
          val: 5
        }
      }
    };
  }
}