struct A {
  a1: Int;
}

struct B {
  b1: Int;
}

struct C {
  x: A;
  y: B;
}

contract Test {
  receive() {
    let c = C{ x: A{ a1: 1 }, y: B{ b1: 2 } };
  }
}