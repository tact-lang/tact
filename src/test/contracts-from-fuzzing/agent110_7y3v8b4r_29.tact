struct Child {
    v: Int;
}

struct Parent {
    c1: Child;
    c2: Child;
}

contract DoubleNested {
    parent: Parent;

    init() {
        self.parent = Parent{
            c1: Child{v: 1},
            c2: Child{v: 2}
        };
    }
}