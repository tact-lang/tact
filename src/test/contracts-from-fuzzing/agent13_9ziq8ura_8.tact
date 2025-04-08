struct Leaf {
    flag: Bool?;
    value: Int?;
}

struct Node {
    left: Leaf?;
    right: Leaf?;
}

struct Tree {
    root: Node?;
    branch: Node?;
}

contract ComplexOptionalTree {
    t: Tree?;

    init() {
        self.t = null;
    }
}