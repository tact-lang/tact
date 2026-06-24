struct A {
  foo: Int as uint8;
}

struct B {
  bar: A;
}

contract NestedSerialization {
  value: B;

  init() {
    self.value = B{ bar: A{ foo: 255 } };
  }
}
