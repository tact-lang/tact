struct Chain1 {
  a: Int;
}
struct Chain2 {
  c1: Chain1;
}
struct Chain3 {
  c2: Chain2;
}

contract LongChain {
  x: Chain3;

  init() {
    self.x = Chain3{c2: Chain2{c1: Chain1{a: 5}}};
  }
}
