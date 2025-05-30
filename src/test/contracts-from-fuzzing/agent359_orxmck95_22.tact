struct Leaf {
    s: String?;
}

struct Branch {
    l: Leaf;
}

struct Tree {
    b: Branch?;
}

contract TestContract {
    t: Tree;

    init() {
        self.t = Tree{ b: null };
    }
}