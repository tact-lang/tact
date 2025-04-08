struct Leaf {
    b: Bool;
}

struct Branch {
    leaf: Leaf?;
}

contract TestContract {
    tree: Branch;

    init() {
        self.tree = Branch{
            leaf: null
        };
    }
}