struct Inner {
  a: Int;
}

struct Outer {
  x: Int;
  s: Inner;
  y: Int;
}

contract RepeatStructs {
  a: Outer;
  b: Outer;

  init() {
    self.a = Outer{x:1,s:Inner{a:2},y:3};
    self.b = Outer{x:4,s:Inner{a:5},y:6};
  }
}