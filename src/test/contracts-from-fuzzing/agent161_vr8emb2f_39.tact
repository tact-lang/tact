// Contract with nested struct chains and default values

struct SLeaf {
    k: Int = 1;
    s: String = "leaf";
}

struct SBranch {
    leaf: SLeaf;
    optLeaf: SLeaf?;
}

contract ChainDefault {
    branch: SBranch;

    init() {
        self.branch = SBranch{
            leaf: SLeaf{},
            optLeaf: null,
        };
    }
}
