struct ChainA { next: ChainB; }
struct ChainB { next: ChainC; }
struct ChainC { next: ChainD; }
struct ChainD { leaf: Int; }

contract DeepChain {
  data: ChainA;

  init() {
    self.data = ChainA{
      next: ChainB{
        next: ChainC{
          next: ChainD{ leaf: 7 }
        }
      }
    };
  }
}