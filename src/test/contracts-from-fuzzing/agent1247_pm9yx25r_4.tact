struct A {
  foo: Int;
}

struct B {
  bar: Int;
}

struct C {
  a: A;
  b: B;
}

struct D {
  c: C;
}

contract NestedChain {
  val: D = D{ c: C{ a: A{foo:1}, b: B{bar:2} } };

  init() {}
}