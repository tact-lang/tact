struct Leaf {
    val: Int?;
}

struct Branch {
    left: Leaf?;
    right: Leaf?;
}

struct Tree {
    root: Branch?;
    label: String;
}

contract PartialInitNestedOpt {
    t: Tree;

    init() {
        self.t = Tree{
            root: Branch{ left: null, right: Leaf{} },
            label: "partial"
        };
    }
}