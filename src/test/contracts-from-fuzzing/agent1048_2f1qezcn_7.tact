struct Child {
    id: Int;
    val: Int?;
}

struct Parent {
    child1: Child;
    child2: Child;
}

contract NestedOptionals {
    field: Parent;

    init() {
        self.field = Parent{
            child1: Child{
                id: 1,
                val: null,
            },
            child2: Child{
                id: 2,
                val: null,
            },
        };
    }
}