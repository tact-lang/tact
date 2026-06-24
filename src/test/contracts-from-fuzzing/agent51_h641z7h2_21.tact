struct L2 {
  a: Int = 1;
  b: Bool = true;
}

struct L1 {
  f1: L2;
  f2: L2;
  f3: L2;
}

contract Test {
  l1: L1;
  init() {
    self.l1 = L1{
      f1: L2{},
      f2: L2{},
      f3: L2{}
    };
  }
}