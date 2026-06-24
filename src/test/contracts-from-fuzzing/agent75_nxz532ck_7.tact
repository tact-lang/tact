struct Leaf {
    val: Int?;
}

struct Branch {
    leaf: Leaf?;
}

struct Root {
    branch: Branch?;
}

contract Test {
    tree: Root;

    init() {
        self.tree = Root{};
    }
}