struct A {
  i: Int;
  b: Bool;
}

struct B {
  j: Int;
  c: Bool;
}

struct C {
  a: A;
  b: B;
}

contract Compose {
  c: C;

  init() {
    self.c = C{
      a: A{ i: 1, b: false },
      b: B{ j: 2, c: true },
    };
  }
}