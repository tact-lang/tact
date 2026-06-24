struct Chain1 { x: Int; }
struct Chain2 { c1: Chain1; }
struct Chain3 { c2: Chain2; }
struct Chain4 { c3: Chain3; }

contract ChainContract {
  data: Chain4;

  init() {
    self.data = Chain4 { c3: Chain3{ c2: Chain2{ c1: Chain1{x: 123} } } };
  }
}