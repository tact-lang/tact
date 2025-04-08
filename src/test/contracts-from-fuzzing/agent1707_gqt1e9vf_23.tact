struct SiblingA { x: Int }
struct SiblingB { y: Int }

struct Parent {
    a: SiblingA;
    b: SiblingB;
}

contract MultiSibling {
    field: Parent;

    init() {
        self.field = Parent{ a: SiblingA{ x: 1 }, b: SiblingB{ y: 2 } };
    }
}