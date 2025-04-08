struct Leaf {
    val: Int?;
}

struct Branch {
    left: Leaf?;
    right: Leaf?;
}

struct Root {
    mainBranch: Branch?;
}

contract ComplexOptionalNest {
    tree: Root;

    init() {
        self.tree = Root{
            mainBranch: Branch{
                left: null,
                right: Leaf{ val: 123 },
            },
        };
    }

    receive() {}
}