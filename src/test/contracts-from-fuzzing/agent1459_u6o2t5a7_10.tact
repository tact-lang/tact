struct LeafA {
    x: Int;
}

struct LeafB {
    y: Int;
}

struct Parent {
    left: LeafA;
    right: LeafB;
}

contract SiblingStructs {
    val: Parent;

    init() {
        self.val = Parent{
            left: LeafA{ x: 1 },
            right: LeafB{ y: 2 }
        };
    }
}
