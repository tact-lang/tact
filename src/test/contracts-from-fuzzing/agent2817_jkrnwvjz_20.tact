struct A {
  a: Int;
}

struct B {
  b: Int;
}

contract StructsTogether {
  first: A;
  second: B;

  init() {
    self.first = A{ a:1 };
    self.second = B{ b:2 };
  }
}
