struct Child {
    x: Int;
}

struct Parent {
    c1: Child;
    c2: Child;
    c3: Child;
    c4: Child;
}

contract NestedSiblings {
    p: Parent;

    init() {
        self.p = Parent{
            c1: Child{ x: 1 },
            c2: Child{ x: 2 },
            c3: Child{ x: 3 },
            c4: Child{ x: 4 }
        };
    }
}
