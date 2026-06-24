struct Inner {
  val: Int;
}

struct Outer {
  inner: Inner?;
  flag: Bool;
}

contract OptNested {
  state: Outer;
  init() {
    self.state = Outer{
      inner: null,
      flag: false
    };
  }
}