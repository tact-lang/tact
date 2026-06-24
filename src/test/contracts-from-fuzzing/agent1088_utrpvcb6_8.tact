struct Inner {
  x: Int;
  y: Int;
}

struct Outer {
  i1: Inner;
  i2: Inner;
  i3: Inner;
}

contract MultiNested {
  storage: Outer;

  init() {
    self.storage = Outer{
      i1: Inner{x:1,y:2},
      i2: Inner{x:3,y:4},
      i3: Inner{x:5,y:6}
    };
  }
}