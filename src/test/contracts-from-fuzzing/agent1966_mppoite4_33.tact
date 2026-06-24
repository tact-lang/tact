struct L1 {
  a: Int;
}

struct L2 {
  a: L1;
  b: L1;
}

struct L3 {
  a: L2;
  b: L2;
}

contract NestedDupStructs {
  storage: L3;

  init() {
    self.storage = L3{
      a: L2{
        a: L1{ a: 11 },
        b: L1{ a: 12 }
      },
      b: L2{
        a: L1{ a: 21 },
        b: L1{ a: 22 }
      }
    };
  }
}
