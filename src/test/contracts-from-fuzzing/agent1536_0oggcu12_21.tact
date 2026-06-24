// Contract: nested optional struct types inside nested structs (allowed single optional)
struct Leaf {
    val: Int?;
}

struct Branch {
    leaf: Leaf;
}

struct Tree {
    branch: Branch?;
}

contract OptStructDeep {
    tree: Tree;

    init() {
        self.tree = Tree{
            branch: Branch{ leaf: Leaf{ val: null } }
        };
    }
}