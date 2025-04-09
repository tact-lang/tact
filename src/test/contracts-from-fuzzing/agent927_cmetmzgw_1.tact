struct A { x: Int; y: Int }

struct B { a: A; z: Int }

contract Test {
  val: B;

  init() {
    self.val = B{
      a: A{ x: 1, y: 2 },
      z: 3
    };
  }
}