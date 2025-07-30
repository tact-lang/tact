struct ChainA { x: Int; next: ChainB; }
struct ChainB { y: Int; next: ChainC; }
struct ChainC { z: Int; }

contract StructChain {
  val: ChainA;

  init() {
    self.val = ChainA{
      x: 1,
      next: ChainB{
        y: 2,
        next: ChainC{z:3}
      }
    };
  }
}