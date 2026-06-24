struct A {
  a: Int;
}
struct B {
  b: Int;
}
struct C {
  c: Int;
}

struct Combo {
  f1: A;
  f2: B;
  f3: A;
  f4: C;
}

contract Test {
  data: Combo;

  init() {
    self.data = Combo{
      f1: A{a:1},
      f2: B{b:2},
      f3: A{a:3},
      f4: C{c:4},
    };
  }
}