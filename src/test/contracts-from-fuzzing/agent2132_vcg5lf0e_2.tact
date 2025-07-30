struct Sibling {
    id: Int;
    active: Bool;
}

struct Parent {
    child1: Sibling;
    child2: Sibling;
    status: Bool;
}

struct Root {
    parent: Parent;
    message: String;
    value: Int;
}

contract MultiNested {
    data: Root;

    init() {
        self.data = Root {
            parent: Parent {
                child1: Sibling { id: 1, active: true },
                child2: Sibling { id: 2, active: false },
                status: true
            },
            message: "Test",
            value: 999
        };
    }
}