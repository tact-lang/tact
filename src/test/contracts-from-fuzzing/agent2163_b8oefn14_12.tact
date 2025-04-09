struct Parent {
    child1: Child;
    child2: Child;
}

struct Child {
    val: Int;
}

contract MultipleNested {
    data: Parent;

    init() {
        self.data = Parent{
            child1: Child{val: 1},
            child2: Child{val: 2}
        };
    }
}