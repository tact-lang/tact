struct Child {
    value: Int;
    optFlag: Bool?;
}

struct Parent {
    child1: Child?;
    child2: Child?;
}

contract OptionalsInStructs {
    data: Parent;

    init() {
        self.data = Parent{child1: null, child2: null};
    }
}
