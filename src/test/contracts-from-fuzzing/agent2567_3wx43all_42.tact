struct FinalNode {
  v: Int;
}

struct Chain1 {
  c: FinalNode;
}

struct Chain2 {
  c1: Chain1;
}

struct Chain3 {
  c2: Chain2;
}

contract SuperDeep {
  s: Chain3;

  init() {
    self.s=Chain3{c2: Chain2{c1: Chain1{c: FinalNode{v:123}}}};
  }
}