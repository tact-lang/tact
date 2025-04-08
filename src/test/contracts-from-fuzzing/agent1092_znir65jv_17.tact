struct A {
  p: Int;
}

struct B {
  q: Int;
}

struct C {
  a: A;
  b: B;
}

contract MultiStruct {
  data: C;

  init() {
    self.data = C{
      a: A{p:1},
      b: B{q:2}
    };
  }
}
