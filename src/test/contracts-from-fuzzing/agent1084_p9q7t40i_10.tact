struct A {
  val1: Int = 1;
}

struct B {
  val2: Int = 2;
}

struct C {
  a: A;
  b: B;
}

contract TestContract {
  c: C;
  init() {
    self.c = C{ a: A{}, b: B{} };
  }
  receive() {}
}