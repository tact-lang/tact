struct Inner {
  a: Int;
}

struct Outer {
  ref1: Inner;
  ref2: Inner;
  ref3: Inner;
}

contract RepeatedRefs {
  val: Outer;

  init() {
    self.val = Outer{
      ref1: Inner{a:1},
      ref2: Inner{a:2},
      ref3: Inner{a:3}
    };
  }
}