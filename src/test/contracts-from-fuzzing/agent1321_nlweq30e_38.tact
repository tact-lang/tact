// deeply nested chain with multiple many-field structs as layers
struct L4 {
  a:Int; b:Int; c:Int; d:Int;
}

struct L3 {
  left: L4;
  right: L4;
}

struct L2 {
  l: L3;
  r: L3;
}

contract MultiDeep {
  l2: L2;

  init() {
    self.l2 = L2{
      l: L3{
        left: L4{a:1,b:2,c:3,d:4},
        right: L4{a:5,b:6,c:7,d:8}
      },
      r: L3{
        left: L4{a:9,b:10,c:11,d:12},
        right: L4{a:13,b:14,c:15,d:16}
      }
    };
  }
}
