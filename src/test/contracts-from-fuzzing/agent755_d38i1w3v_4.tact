struct Inner1 {
  a: Int;
}

struct Inner2 {
  b: Int;
  c: Inner1;
}

contract NestedStructsTest {
  x: Inner2;

  init() {
    self.x = Inner2{ b: 1, c: Inner1{ a: 2 } };
  }
}