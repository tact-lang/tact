struct Leaf {
    val: Int?;
}

struct Branch {
    leaf: Leaf?;
}

contract Tree {
    root: Branch;
    init() {
        self.root = Branch{ leaf: null };
    }
}
