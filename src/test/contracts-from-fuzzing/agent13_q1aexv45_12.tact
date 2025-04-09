struct A {
  val: Int;
}

struct B {
  a: A?;
}

struct C {
  b: B?;
}

contract OptDeep {
  c: C?;

  init() {
    self.c = null;
  }
}