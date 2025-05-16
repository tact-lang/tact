struct Leaf {
    val: Int?;
}

struct Branch {
    leaf: Leaf?;
    label: String;
}

struct Root {
    branch1: Branch?;
    branch2: Branch?;
}

contract TreeLike {
    tree: Root;

    init() {
        self.tree = Root{
            branch1: null,
            branch2: Branch{
                leaf: Leaf{ val: 123 },
                label: "active"
            }
        };
    }
}