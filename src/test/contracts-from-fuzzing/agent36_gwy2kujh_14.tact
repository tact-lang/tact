struct A { a: Int; }

struct B { b: A; }

struct C { c: B; }

contract Test {
  receive() {
    let x: C = C{ c: B{ b: A{ a: 42 } } };
  }
}