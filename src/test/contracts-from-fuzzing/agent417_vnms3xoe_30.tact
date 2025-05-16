struct ChainA { v: Int; }
struct ChainB { next: ChainA; }
struct ChainC { next: ChainB; }

contract ChainLink {
  f: ChainC;
  init() {
    self.f = ChainC{
        next: ChainB{
           next: ChainA{
              v: 77
           }
        }
    };
  }
}