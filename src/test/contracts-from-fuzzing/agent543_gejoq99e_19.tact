struct A {
  x: Int;
}

struct B {
  y: Int;
}

contract ManyStructFields {
  a: A;
  b: B;
  c: Int;
  d: Int?;
  e: Bool;

  init() {
    self.a = A{x:1};
    self.b = B{y:2};
    self.c = 3;
    self.d = null;
    self.e = true;
  }
}
