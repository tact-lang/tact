struct Inner {
  foo: Int;
}

struct Outer {
  inr: Inner?;
}

contract OptionalNestedStruct {
  obj: Outer;

  init() {
    self.obj = Outer{ inr: null };
  }
}