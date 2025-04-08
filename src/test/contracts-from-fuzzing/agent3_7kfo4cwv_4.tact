struct A {
  a1: Int;
  a2: Bool;
}

struct B {
  b1: A;
  b2: Int?;
}

struct C {
  c1: B;
  c2: String;
}

contract OptionalNested {
  x: C?;

  init() {
    self.x = null;
  }

  receive() {}
}