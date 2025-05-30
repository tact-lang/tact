struct S {
  a: Int;
  b: Bool;
  c: String;
}

contract NestedInits {
  f1: S = S{a:1,b:true,c:"foo"};
  f2: S = S{a:2,b:false,c:"bar"};

  init() {
    self.f1 = S{a:3,b:true,c:"baz"};
    self.f2 = S{a:4,b:false,c:"qux"};
  }
}