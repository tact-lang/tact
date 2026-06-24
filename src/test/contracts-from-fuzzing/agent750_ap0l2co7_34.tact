struct NestedInner {
  foo: Int;
}

struct Outer {
  a: Bool;
  n: NestedInner?;
}

contract OptionalNestedInOuter {
  o: Outer;

  init() {
    self.o = Outer{a:true, n:null};
  }
}