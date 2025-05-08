struct A {
  val: Int;
}

struct B {
  inner: A?;
}

contract OptInner {
  b: B = B{inner: null};
  init() {}
}