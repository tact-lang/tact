struct A {
  x: Int;
}
struct B {
  y: Int?;
}
contract ManyStructOptionals {
  a: A;
  b: B;

  init() {
    self.a = A{ x: 5 };
    self.b = B{ y: null };
  }
}