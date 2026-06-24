struct Leaf {
    name: String?;
}

struct Branch {
    leaf: Leaf?;
}

struct Tree {
    branch: Branch?;
}

contract Test {
    t: Tree;

    init() {
        self.t = Tree{ branch: null };
    }
}