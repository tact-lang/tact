struct A {
 a: Int;
}

struct B {
  b1: A;
  b2: A;
}

struct CNestedOptional {
  f: B?;
}

contract NestedOptStruct {
  foo: CNestedOptional;
  init() {
    self.foo = CNestedOptional{f:null};
  }
}