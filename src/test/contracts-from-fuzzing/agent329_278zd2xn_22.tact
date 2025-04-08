struct Child {
    id: Int;
    active: Bool;
}

struct Parent {
    child1: Child;
    child2: Child;
}

contract TestContract {
    hierarchy: Parent;

    init() {
        self.hierarchy = Parent{
            child1: Child{ id: 1, active: true },
            child2: Child{ id: 2, active: false },
        };
    }
}