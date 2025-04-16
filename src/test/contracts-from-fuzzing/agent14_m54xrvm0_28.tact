struct Leaves {
    a: Slice?;
    b: Cell?;
}

struct Branch {
    l1: Leaves?;
    l2: Leaves?;
}

contract Test28 {
    tree: Branch;

    init() {
        self.tree = Branch{ l1: null, l2: null };
    }
}
