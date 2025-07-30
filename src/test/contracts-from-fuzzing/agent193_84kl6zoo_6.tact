struct Outer {
  a: Int;
  optInner: Inner?;
}

struct Inner {
  b: Int;
  c: Bool;
}

contract OptionalNestedStruct {
  outer: Outer;

  init() {
    self.outer = Outer{ a:1, optInner:null };
  }
}