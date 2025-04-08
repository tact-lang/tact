struct DeepNest3 {
  innermost: Int;
}

struct DeepNest2 {
  inner: DeepNest3;
}

struct DeepNest1 {
  middle: DeepNest2;
}

contract TestDeep {
  val: DeepNest1;
  init() {
    self.val = DeepNest1 { middle: DeepNest2 { inner: DeepNest3 { innermost: 42 } } };
  }
}
