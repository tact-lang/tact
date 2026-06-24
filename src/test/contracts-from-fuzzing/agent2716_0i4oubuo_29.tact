struct Chain1 { n: Int; }
struct Chain2 { c1: Chain1; }
struct Chain3 { c2: Chain2; }
struct Chain4 { c3: Chain3; }
struct Chain5 { c4: Chain4; }
contract DeepChain5 {
  data: Chain5;
  init() {
    self.data = Chain5{c4: Chain4{c3: Chain3{c2: Chain2{c1: Chain1{n:1}}}}};
  }
}