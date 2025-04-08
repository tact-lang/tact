struct PrimNest {
  a: Int;
  b: Bool;
}

struct Mid1 {
  p: PrimNest;
}
struct Mid2 {
  mid1: Mid1;
}
struct Mid3 {
  mid2: Mid2;
}
contract ChainDeepNest {
  chain: Mid3;
  init() {
    self.chain = Mid3{
      mid2: Mid2{
        mid1: Mid1{
          p: PrimNest{
            a: 55,
            b: true
          }
        }
      }
    };
  }
}