struct Leaf {
    leafVal: Int as uint8;
    leafFlag: Bool;
    leafOpt: Int?;
}

struct Branch {
    branchVal: Int as int16;
    nestedLeaf: Leaf;
}

struct Root {
    rootVal: Int;
    nestedBranch: Branch;
}

contract TestContract {
    tree: Root;

    init() {
        self.tree = Root{
            rootVal: 123,
            nestedBranch: Branch{
                branchVal: -1234,
                nestedLeaf: Leaf{ leafVal: 255, leafFlag: true, leafOpt: null }
            }
        };
    }
}