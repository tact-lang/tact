struct A {
  f1: Int;
}
struct B {
  f2: Int;
}
struct C {
  a: A;
  b: B;
}
contract ABCCompose {
  data: C;
  init() {
    self.data = C{ a: A{f1:11}, b: B{f2:22} };
  }
}