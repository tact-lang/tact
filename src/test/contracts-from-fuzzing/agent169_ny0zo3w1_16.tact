struct Child {
    data: String;
}

struct Parent {
    child1: Child;
    child2: Child;
    number: Int;
}

contract TestContract {
    p: Parent;

    init() {
        self.p = Parent{
            child1: Child{ data: "first" },
            child2: Child{ data: "second" },
            number: 10
        };
    }
}