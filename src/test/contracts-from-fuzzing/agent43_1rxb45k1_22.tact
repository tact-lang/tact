struct A { x: Int; }
struct B { a: A; }

contract Test {
  receive() {
    let b = B{ a: A{ x: 1 } };
    let y = b.a.x;
  }
}