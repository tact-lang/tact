struct Child {
    x: Int;
}

struct Parent {
    a: Child;
    b: Child;
}

contract MultiNested {
    p: Parent;

    init() {
        self.p = Parent{
            a: Child{x: 1},
            b: Child{x: 2},
        };
    }
}