struct A {
  i: Int = 1;
}
struct B {
  a: A;
  b: Bool = false;
}
struct C {
  b: B;
}
contract ChainDepth {
  root: C = C{ b: B{ a: A{}, b: false } };
}