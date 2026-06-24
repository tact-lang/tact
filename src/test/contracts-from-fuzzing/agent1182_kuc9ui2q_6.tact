struct A {
  x: Int;
}

struct B {
  y: Int;
  optA: A?;
}

contract OptNested {
  val: B;

  init() {
    self.val = B{ y:7, optA: null };
  }
}
