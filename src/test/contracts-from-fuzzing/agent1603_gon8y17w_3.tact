struct Outer {
  in1: Inner1;
  in2: Inner2;
}

struct Inner1 {
  x: Int;
}

struct Inner2 {
  y: Bool;
}

contract NestedStructFieldTest {
  nested: Outer;

  init() {
    self.nested = Outer{
      in1: Inner1{ x: 7 },
      in2: Inner2{ y: true },
    };
  }
}