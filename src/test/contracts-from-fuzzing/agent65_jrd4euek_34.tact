struct Deep {
 d1: Int?;
 d2: Int; 
}

struct Mid {
  m1: Deep;
}

contract NestedOptMid {
  val: Mid;
  init() {
    self.val = Mid{ m1: Deep{ d1:null, d2:55 } };
  }
}