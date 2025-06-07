struct A {
  x: Int;
}

struct B {
  y: Int;
}

struct C {
  a: A?;
  b: B?;
}

contract OptSubstructs {
  v: C;
  init() {
    self.v = C{ a: null, b: null };
  }
}