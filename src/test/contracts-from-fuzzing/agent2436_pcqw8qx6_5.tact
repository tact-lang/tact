struct DeepNest3 {
  flag: Bool;
}

struct DeepNest2 {
  sub: DeepNest3;
}

struct DeepNest1 {
  sub: DeepNest2;
}

contract Depth {
  d: DeepNest1;

  init() {
    self.d = DeepNest1{sub: DeepNest2{sub: DeepNest3{flag: true}}};
  }
}