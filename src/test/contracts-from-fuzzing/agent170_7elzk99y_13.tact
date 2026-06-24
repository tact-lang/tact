struct Outer {
  s1: Inner;
  s2: Inner;
}

struct Inner {
  val: Int;
}

contract ArrayLike {
  outer: Outer;

  init() {
    self.outer = Outer{
      s1: Inner{val:1},
      s2: Inner{val:2}
    };
  }
}