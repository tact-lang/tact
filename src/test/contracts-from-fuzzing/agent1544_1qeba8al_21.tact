struct NestedStruct {
  s: Inner;
}

struct Inner {
  foo: Int;
  bar: Bool;
}

contract MixedOptNested {
  val: NestedStruct?;

  init() {
    self.val = null;
  }
}
