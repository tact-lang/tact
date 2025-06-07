struct Leaf {
    val: Int;
}

struct Branch {
    leaf: Leaf?;
    note: String?;
}

struct Trunk {
    branch: Branch?;
    height: Int?;
}

struct Tree {
    trunk: Trunk?;
    species: String?;
}

contract Test {
    tree: Tree;

    init() {
        self.tree = Tree{
            trunk: Trunk{
                branch: null,
                height: null
            },
            species: null
        };
    }
}