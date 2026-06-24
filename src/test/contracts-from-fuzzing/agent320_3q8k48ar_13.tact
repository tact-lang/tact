struct LeafOpt {
    leafVal: Int?;
}

struct Branch {
    leaf: LeafOpt?;
}

struct Tree {
    branch: Branch?;
}

contract NestedOptDeep {
    t: Tree;
    init() {
        self.t = Tree{ branch: null };
    }
}