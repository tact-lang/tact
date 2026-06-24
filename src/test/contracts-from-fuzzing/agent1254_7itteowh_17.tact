struct OptInDeep {
    leaf: Int?;
}

struct TreeBranch {
    branchVal: Int;
    optLeaf: OptInDeep?;
}

struct RootNode {
    mainVal: Int;
    branch: TreeBranch;
}

contract OptionInDeepStructure {
    root: RootNode;
    init() {
        self.root = RootNode{
            mainVal: 1,
            branch: TreeBranch{
                branchVal: 2,
                optLeaf: null,
            }
        };
    }
}