struct A {
  x: Int;
}

struct B {
  y: Int?;
  a: A;
}

contract OptionalNestedStruct {
  data: B;

  init() {
    self.data = B{
      y: null,
      a: A{ x: 99 },
    };
  }
}
