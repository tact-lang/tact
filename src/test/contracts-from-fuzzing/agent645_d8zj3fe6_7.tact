struct A {
  ia: Int;
}

struct B {
  ib: Int;
}

struct C {
  ic: Int;
}

contract MultiNested {
  na: A;
  nb: B;
  nc: C;

  init() {
    self.na = A{ ia: 1 };
    self.nb = B{ ib: 2 };
    self.nc = C{ ic: 3 };
  }
}
