struct Child {
    data: Int;
}

struct Parent {
    child1: Child;
    child2: Child;
    child3: Child;
}

contract TestContract {
    parentField: Parent;

    init() {
        self.parentField = Parent{
            child1: Child{ data: 1 },
            child2: Child{ data: 2 },
            child3: Child{ data: 3 },
        };
    }
}
