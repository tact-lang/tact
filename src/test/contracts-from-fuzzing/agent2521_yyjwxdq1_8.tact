struct L3 {
  a: Int;
  b: Bool;
}

struct L2 {
  l3_1: L3;
  l3_2: L3;
}

struct L1 {
  l2_1: L2;
  l2_2: L2;
}

contract NestContract {
  storage: L1;

  init() {
    self.storage = L1{
      l2_1: L2{
        l3_1: L3{ a: 1, b: true },
        l3_2: L3{ a: 2, b: false },
      },
      l2_2: L2{
        l3_1: L3{ a: 3, b: true },
        l3_2: L3{ a: 4, b: false },
      }
    };
  }
}
