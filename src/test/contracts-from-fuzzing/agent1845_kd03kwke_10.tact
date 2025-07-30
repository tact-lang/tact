// Chain of multiple nested structs with optional at bottom
struct L3 { val: Int?; }
struct L2 { inner: L3; }
struct L1 { inner: L2; }

contract ChainOpt {
  chain: L1;
  init() {
    self.chain = L1{
      inner: L2{
        inner: L3{
          val: null
        }
      }
    };
  }
}
