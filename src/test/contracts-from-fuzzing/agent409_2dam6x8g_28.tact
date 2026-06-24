struct SLeaf {
    val: Int;
}

struct SBranch {
    left: SLeaf;
    right: SLeaf?;
}

struct Tree {
    root: SBranch;
    other: SBranch?;
}

contract Trees {
    t: Tree?;

    init() {
        self.t = null;
    }
}