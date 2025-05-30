struct Child {
    val1: Int;
    val2: Int;
}

struct Parent {
    child1: Child;
    child2: Child;
}

contract DoubleNested {
    data: Parent;

    init() {
        self.data = Parent{
            child1: Child{ val1: 1, val2: 2 },
            child2: Child{ val1: 3, val2: 4 }
        };
    }
}