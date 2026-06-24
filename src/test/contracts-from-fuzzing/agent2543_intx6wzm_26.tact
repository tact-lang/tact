struct Inner {
  x: Int;
}

struct Outer {
  inner: Inner;
}

contract RefStruct {
  s: Outer;
  init() {
    self.s = Outer{ inner: Inner{ x: 4 } };
  }
}