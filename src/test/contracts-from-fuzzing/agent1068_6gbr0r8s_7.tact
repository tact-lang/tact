struct Leaf {
    a: Int;
}

struct Branch {
    left: Leaf?;
    right: Leaf?;
}

contract Tree {
    root: Branch?;

    init() {
        self.root = null;
    }
}