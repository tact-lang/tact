struct NestedStruct {
    child1: Child;
    child2: Child;
}

struct Child {
    val1: Int;
    val2: Int;
}

contract NestedContract {
    data: NestedStruct;

    init() {
        self.data = NestedStruct{
            child1: Child{val1: 1, val2: 2},
            child2: Child{val1: 3, val2: 4}
        };
    }
}
