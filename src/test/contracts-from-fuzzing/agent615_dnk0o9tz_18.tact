struct A {
  a: Int;
}

struct B {
  b: Int;
}

struct C {
  c: Int;
}

contract TestContract {
  one: A;
  two: B;
  three: C;

  init() {
    self.one = A{a:1};
    self.two = B{b:2};
    self.three = C{c:3};
  }
}