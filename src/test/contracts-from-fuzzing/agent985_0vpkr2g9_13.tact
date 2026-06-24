struct Outer {
  inner1: Inner;
  inner2: Inner;
}

struct Inner {
  a: Int;
  b: Bool;
}

contract DuplicateInner {
  out: Outer;

  init() {
    self.out = Outer{
      inner1: Inner{a:1, b:true},
      inner2: Inner{a:2, b:false}
    };
  }
}