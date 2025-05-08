struct A {
  x: Int;
}

struct B {
  y: A?;
}

struct C {
  z: B?;
}

contract DeepOptional {
  opt: C?;

  init() {
    self.opt = null;
  }
}