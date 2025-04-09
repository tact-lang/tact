struct L1 {
  f1: Int;
  f2: Int?;
}

struct L2 {
  l1: L1;
  f3: Int;
}

struct L3 {
  l2: L2;
  f4: Bool;
}

contract DeepNest {
  data: L3;

  init() {
    self.data = L3{
      l2: L2{
        l1: L1{ f1:5, f2:null },
        f3: 7
      },
      f4: true
    };
  }
}