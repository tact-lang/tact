struct Child {
    x: Int;
}

struct Parent {
    child1: Child;
    child2: Child;
    child3: Child;
    child4: Child;
    child5: Child;
}

contract TestContract {
    data: Parent;
    init() {
        self.data = Parent{
            child1: Child{ x: 1 },
            child2: Child{ x: 2 },
            child3: Child{ x: 3 },
            child4: Child{ x: 4 },
            child5: Child{ x: 5 },
        };
    }
}
