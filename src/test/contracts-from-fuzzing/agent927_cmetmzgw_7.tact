struct ChainA { next: ChainB; val: Int }
struct ChainB { next: ChainC; val: Int }
struct ChainC { val: Int }

contract ChainTest {
  root: ChainA;

  init() {
    self.root = ChainA{
      next: ChainB{
        next: ChainC{ val: 3 },
        val: 2
      },
      val: 1
    };
  }
}