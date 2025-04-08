struct Inner {
  x: Int as int64;
  y: Int as int64;
}

struct Outer {
  p1: Inner;
  p2: Inner;
  p3: Inner;
}

contract TestContract {
  data: Outer;

  init() {
    self.data = Outer{
      p1: Inner{x:1,y:2},
      p2: Inner{x:3,y:4},
      p3: Inner{x:5,y:6},
    };
  }
}
