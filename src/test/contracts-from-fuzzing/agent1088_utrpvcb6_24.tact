struct Inner {
  foo: Int;
}

struct Outer {
  a: Int;
  b: Inner;
  c: Bool;
}

contract MixedOrder {
  storage: Outer;

  init() {
    self.storage = Outer{a:1, b: Inner{foo:2}, c:true};
  }
}