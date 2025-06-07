struct Child {
    a: Int;
    b: Bool;
}

struct Parent {
    child1: Child;
    child2: Child;
    flag: Bool;
}

contract MultiNestedTest {
    parent: Parent;

    init() {
        self.parent = Parent{
            child1: Child{a: 1, b: true},
            child2: Child{a: 2, b: false},
            flag: true
        };
    }
}