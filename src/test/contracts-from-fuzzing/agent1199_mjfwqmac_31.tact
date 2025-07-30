struct ChainD1 { next: ChainD2; }
struct ChainD2 { next: ChainD3; }
struct ChainD3 { next: ChainD4; }
struct ChainD4 { val: Int; }

contract Test31 {
  c: ChainD1;

  init() {
    self.c = ChainD1{
      next: ChainD2{
        next: ChainD3{
          next: ChainD4{val:42}
        }
      }
    };
  }
}