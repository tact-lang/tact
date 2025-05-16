struct A {
  f1: Int;
}

struct B {
  f2: A;
}

struct C {
  f3: B;
}

contract DeepStruct {
  s: C;

  init() {
    self.s = C{ f3: B{ f2: A{ f1: 11 } } };
  }

  receive() {
    let _ = self.s.f3.f2.f1;
  }
}