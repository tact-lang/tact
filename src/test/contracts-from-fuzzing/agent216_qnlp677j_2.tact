struct NestedOne {
    f1: Bool;
}

struct NestedTwo {
    n1: NestedOne;
}

struct NestedThree {
    n2: NestedTwo;
}

contract DeepChain {
    data: NestedThree;

    init() {
        self.data = NestedThree{ n2: NestedTwo{ n1: NestedOne{ f1: false } } };
    }
}