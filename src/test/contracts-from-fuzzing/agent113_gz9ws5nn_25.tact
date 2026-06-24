struct Inner {
  x: Int;
}

struct Outer {
  opt: Inner?;
}

contract OptInnerField {
  data: Outer;

  init() {
    self.data = Outer{ opt: null };
  }
}