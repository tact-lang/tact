struct A {
  a: Int;
}

struct B {
  b: Int;
}

struct C {
  c: Int;
}

contract ManyStructs {
  a: A = A{ a: 1 };
  b: B = B{ b: 2 };
  c: C = C{ c: 3 };
}
