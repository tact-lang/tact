struct Child {
    i: Int;
}

struct Parent {
    c: Child;
}

contract OptionalNested {
    p: Parent?;

    init() {
        self.p = Parent{ c: Child{ i: 5 } };
    }
}
