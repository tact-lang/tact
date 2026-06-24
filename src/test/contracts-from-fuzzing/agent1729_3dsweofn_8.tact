struct A {
  a: Int;
}

struct B {
  b: Int;
  subA: A;
}

struct C {
  c: Int;
  subB: B;
}

contract TestContract {
  cval: C;

  init() {
    self.cval = C{
      c: 9,
      subB: B{
        b: 8,
        subA: A{ a: 7 },
      },
    };
  }
}