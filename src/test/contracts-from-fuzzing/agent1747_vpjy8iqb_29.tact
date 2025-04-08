struct Child {
    val: Int;
}

struct Parent {
    c: Child;
}

contract NestedFieldDefaults {
    v: Parent = Parent{ c: Child{ val: 10 } };

    init() {
        self.v = Parent{ c: Child{ val: 20 } };
    }
}