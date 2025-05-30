struct SiblingA { x: Int; y: Int?; }
struct SiblingB { u: Int?; v: Int; }

struct Parent {
  one: SiblingA;
  two: SiblingB;
}

contract NestingSiblings {
  root: Parent;

  init() {
    self.root = Parent{
      one: SiblingA{ x: 1, y: null },
      two: SiblingB{ u: 2, v: 3 }
    };
  }
}