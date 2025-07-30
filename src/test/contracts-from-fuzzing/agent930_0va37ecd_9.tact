struct Child {
    value: Int;
}

struct Parent {
    c1: Child;
    c2: Child;
    c3: Child;
}

contract MultiNested {
    field: Parent;

    init() {
        self.field = Parent{
            c1: Child{ value: 1 },
            c2: Child{ value: 2 },
            c3: Child{ value: 3 },
        };
    }
}
