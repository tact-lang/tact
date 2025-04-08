struct P {
 x: Int;
 y: Int;
}

struct Q {
 p: P;
 z: Int;
}

struct R {
 q: Q;
 w: Bool;
}

contract MultiNest {
  r: R;
  init() {
    self.r = R{
      q: Q{
         p: P{ x:1, y:2 },
         z:3
      },
      w: true
    };
  }
}