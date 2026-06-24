struct L3 {
  d: Int?;
  e: Bool;
}

struct L2 {
  c: L3;
  s: String?;
}

struct L1 {
  a: Int;
  b: L2?;
}

contract DeepNest {
  root: L1;

  init() {
    self.root = L1{
      a: 42,
      b: L2{
        c: L3{
          d: null,
          e: true
        },
        s: null
      }
    };
  }
}
