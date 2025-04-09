struct Inner {
  foo: Int;
  bar: Bool;
}

contract StructArray {
  a: Inner;
  b: Inner;
  c: Inner;
  d: Inner;

  init() {
    self.a = Inner{foo:1,bar:true};
    self.b = Inner{foo:2,bar:false};
    self.c = Inner{foo:3,bar:true};
    self.d = Inner{foo:4,bar:false};
  }
}