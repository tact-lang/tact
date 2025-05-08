struct A {
  x: Int;
}

struct B {
  y: Int;
}

struct Wrapper {
  sa: A;
  sb: B;
}

contract TupleStructsTest {
  tup: Wrapper = Wrapper {
    sa: A{ x: 1 },
    sb: B{ y: 2 }
  };
  init() {}
}