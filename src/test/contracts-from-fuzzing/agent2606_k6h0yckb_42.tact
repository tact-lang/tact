struct A { x: Int }
struct B { a: A }
struct C { b: B }

contract ChainStruct {
  val: C;

  init() {
    self.val = C{ b: B{ a: A{ x: 1 } } };
  }
}