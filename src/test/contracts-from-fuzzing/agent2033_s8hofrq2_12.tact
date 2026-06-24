struct Child {
    value: Int;
    label: String;
}

struct Parent {
    child1: Child;
    child2: Child;
    child3: Child;
}

contract Test {
    family: Parent;

    init() {
        self.family = Parent{
            child1: Child{ value:1, label:"x" },
            child2: Child{ value:2, label:"y" },
            child3: Child{ value:3, label:"z" }
        };
    }
}