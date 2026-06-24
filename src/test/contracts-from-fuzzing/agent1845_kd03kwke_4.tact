struct S1 {
  a: Int;
}

struct S2 {
  b: Int;
  c: S1;
}

contract DeepNestOpt {
  data: S2?;

  init() {
    self.data = null;
  }
}
