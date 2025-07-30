struct Sibling {
    x: Int;
}

struct Parent {
    child1: Sibling;
    child2: Sibling?;
}

contract Test {
    p: Parent;

    init() {
        self.p = Parent{
            child1: Sibling{ x: 3 },
            child2: null
        };
    }
}