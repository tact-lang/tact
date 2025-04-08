struct L1 {
  x: Int; y: Int;
}

struct L2 {
  a: L1; b: L1; c: L1;
}

struct L3 {
  j: L2;
  k: L2;
}

contract WideDeepNested {
  root: L3;

  init() {
    self.root = L3{
      j: L2{
        a: L1{x:1,y:2},
        b: L1{x:3,y:4},
        c: L1{x:5,y:6}
      },
      k: L2{
        a: L1{x:7,y:8},
        b: L1{x:9,y:10},
        c: L1{x:11,y:12}
      }
    };
  }
}