struct Child {
    v1: Int;
    v2: Bool?;
}

struct Parent {
    c1: Child;
    c2: Child;
    c3: Child;
}

contract Verify {
    storage: Parent;
    init() {
        self.storage = Parent{
            c1: Child{v1: 1, v2: null},
            c2: Child{v1: 2, v2: true},
            c3: Child{v1: 3, v2: false},
        };
    }
}