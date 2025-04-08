struct A {
  f1: Int;
}

struct B {
  f2: Int;
  nestedA: A;
}

struct C {
  f3: Int;
  nestedB: B;
}

contract LongChain {
  data: C;

  init() {
    self.data = C{
      f3: 3,
      nestedB: B{
        f2: 2,
        nestedA: A{ f1: 1 },
      },
    };
  }
}