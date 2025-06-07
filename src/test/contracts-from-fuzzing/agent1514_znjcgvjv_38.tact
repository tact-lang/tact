struct Leaf {
    a: Int;
}

struct Branch {
    b: Leaf;
}

contract OptionalBranch {
    node: Branch?;
    init() {
        self.node = null;
    }
}