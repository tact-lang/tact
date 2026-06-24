struct A {
  n: Int;
  b: B;
}

struct B {
  s: String;
  c: C;
}

struct C {
  fld: Int?;
}

contract TestContract {
  data: A;

  init() {
    self.data = A{
      n:1,
      b: B{
        s:"hi",
        c: C{ fld: null }
      }
    };
  }
}