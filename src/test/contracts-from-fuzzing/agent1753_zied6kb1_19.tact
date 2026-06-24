struct Child {
    a: Int;
    b: Bool;
}

struct Parent {
    child1: Child;
    child2: Child;
}

contract DoubleNested {
    state: Parent;

    init() {
        self.state = Parent{
            child1: Child{a: 10, b: true},
            child2: Child{a: 20, b: false}
        };
    }
}