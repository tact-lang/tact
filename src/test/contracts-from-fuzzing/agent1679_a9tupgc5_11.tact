struct Child {
    intField: Int = 0;
    boolField: Bool = true;
    strField: String = "hi";
}

struct Parent {
    child1: Child;
    child2: Child;
    strField: String = "parent";
}

contract DoubleNested {
    val: Parent;

    init() {
        self.val = Parent{
            child1: Child{},
            child2: Child{}
        };
    }

    receive() {}
}