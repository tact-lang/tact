struct Inner {
  x: Int;
}

struct Outer {
  s: Inner;
  s_opt: Inner?;
}

contract MixNestedOpt {
  val: Outer;

  init() {
    self.val = Outer{
      s: Inner{x:42},
      s_opt: null
    };
  }
}