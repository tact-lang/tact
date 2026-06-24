struct Child {
    info: String;
    value: Int;
}

struct Parent {
    child1: Child?;
    child2: Child?;
    comment: String?;
}

contract Test {
    data: Parent;
    init() {
        self.data = Parent{
            child1: Child{ info: "one", value: 1 },
            child2: null,
            comment: null
        };
    }
}