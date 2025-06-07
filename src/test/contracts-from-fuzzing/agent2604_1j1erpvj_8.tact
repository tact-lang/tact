struct Middle {
  x: Int;
  y: Bool;
}

struct Top {
  m1: Middle;
  m2: Middle;
}

contract NestedSame {
  t: Top;

  init() {
    self.t = Top{
      m1: Middle{ x:1, y:false },
      m2: Middle{ x:2, y:true }
    };
  }
}