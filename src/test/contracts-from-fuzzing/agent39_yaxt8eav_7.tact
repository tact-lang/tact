struct Child {
    i: Int;
    name: String;
}

struct Parent {
    child1: Child;
    child2: Child;
    info: String;
}

contract Family {
    tree: Parent;

    init() {
        self.tree = Parent{
            child1: Child{ i: 1, name: "Ann" },
            child2: Child{ i: 2, name: "Bob" },
            info: "Family tree",
        };
    }
}