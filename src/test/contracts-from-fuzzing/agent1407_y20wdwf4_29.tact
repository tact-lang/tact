struct Leaf {
    x: Int;
}

struct Branch {
    leaf: Leaf?;
}

struct Root {
    branch: Branch?;
}

contract TestContract {
    root: Root;

    init() {
        self.root = Root{ branch: null };
    }
}