struct Child {
    a: Int;
}

struct Parent {
    child1: Child;
    child2: Child;
    child3: Child;
}

contract MultiSameStruct {
    data: Parent;

    init() {
        self.data = Parent{
            child1: Child{ a: 1 },
            child2: Child{ a: 2 },
            child3: Child{ a: 3 }
        };
    }
}