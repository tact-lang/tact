struct Inner {
  a: Int;
  b: Bool;
}

struct Outer {
  c: Inner;
  d: Inner;
}

contract DoubleNested {
  x: Outer;

  init() {
    self.x = Outer {
      c: Inner{a:1,b:true},
      d: Inner{a:2,b:false}
    };
  }
}