struct Inner {
  a: Int as uint8;
  b: Bool;
}

struct Outer {
  inr: Inner;
  val: Int as uint32;
}

contract SerializeNested {
  state: Outer;

  init() {
    self.state = Outer{
      inr: Inner{a: 5, b: true},
      val: 1000
    };
  }
}