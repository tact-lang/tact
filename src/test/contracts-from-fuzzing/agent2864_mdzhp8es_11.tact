struct Inner {
  v1: Int;
  v2: Bool;
}

struct Outer {
  s1: Inner;
}

contract StructDefaults {
  val: Outer;

  init() {
    self.val = Outer{
      s1: Inner{ v1: 3, v2: true }
    };
  }
}