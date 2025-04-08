struct Leaf {
    a: Int?;
    b: Bool?;
}

struct Branch {
    left: Leaf?;
    right: Leaf?;
    sum: Int;
}

contract NestedComplexOptionals {
    node: Branch?;

    init() {
        self.node = null;
    }
}