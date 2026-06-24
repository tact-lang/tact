struct A {
  x: Int;
}

struct B {
  a: A;
}

struct C {
  b: B;
}

struct D {
  c: C;
}

struct E {
  d: D;
}

struct F {
  e: E;
}

contract Test {
  deeply: F = F{ e: E{ d: D{ c:C{ b:B{ a:A{ x:42 } } } } } };

  init() {
    self.deeply = F{ e: E{ d: D{ c:C{ b:B{ a:A{ x:100 } } } } } };
  }

  receive() {}
}
