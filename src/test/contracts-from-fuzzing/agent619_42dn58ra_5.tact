struct Inner {
  x: Int;
}

struct Outer {
  inner: Inner?;
}

contract OptNestedStruct {
  data: Outer;

  init() {
    self.data = Outer{ inner: null };
  }
}
