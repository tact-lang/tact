struct Leaf {
    val: Int;
}

struct Branch {
    leafOpt: Leaf?;
}

struct Tree {
    branch: Branch;
    another: Branch?;
}

contract NestedOptStructs {
    data: Tree = Tree{
        branch: Branch{ leafOpt: Leaf{ val: 42 } },
        another: null
    };
}
