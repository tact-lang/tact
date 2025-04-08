struct S {
  foo: Int;
  bar: Bool;
}

contract Arranged {
  a: S;
  b: S;
  init() {
    self.a = S{foo:1, bar:true};
    self.b = S{foo:2, bar:false};
  }
}