struct A { x: Int; y: Bool }
struct B { z: Address; w: Bool? }

struct Composite {
  inner1: A;
  inner2: B;
}

contract NestedNamed {
  val: Composite;
  init() {
    self.val = Composite{
      inner1: A{ x: 1, y: true },
      inner2: B{ z: myAddress(), w: null }
    };
  }
}