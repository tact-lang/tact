struct Child {
    s: String;
    b: Bool;
    i: Int;
}

struct Parent {
    child1: Child;
    child2: Child;
    child3: Child;
}

contract Nesting {
    data: Parent;

    init() {
        self.data = Parent{
            child1: Child{s: "a", b: true, i: 1},
            child2: Child{s: "b", b: false, i: 2},
            child3: Child{s: "c", b: true, i: 3},
        };
    }
}
