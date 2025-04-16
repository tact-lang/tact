struct Tiny {
  flag: Bool;
  x: Int as uint4;
}

struct Inner {
  val: Int as uint32;
  tiny: Tiny?;
}

struct Outer {
  check: Bool;
  inner: Inner?;
}

contract DeepMixed {
  s: Outer;

  init() {
    self.s = Outer{
      check: true,
      inner: Inner{
        val: 999,
        tiny: null
      }
    };
  }
}
