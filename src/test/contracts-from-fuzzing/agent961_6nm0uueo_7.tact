struct Child {
    value: Int;
}

struct Parent {
    child1: Child;
    child2: Child;
    child3: Child;
}

contract MultiNestedContract {
    data: Parent;

    init() {
        self.data = Parent{
            child1: Child{value:1},
            child2: Child{value:2},
            child3: Child{value:3}
        };
    }
}