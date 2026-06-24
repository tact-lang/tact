struct Child {
    data: Int?;
    flag: Bool;
}

struct Parent {
    child1: Child;
    child2: Child;
    optionalChild: Child?;
}

contract DoubleNested {
    parent: Parent;

    init() {
        self.parent = Parent{
            child1: Child{ data: 1, flag: true },
            child2: Child{ data: null, flag: false },
            optionalChild: null
        };
    }

    receive() {}
}