struct Bush {
    l: Leaf;
    r: Leaf;
}

struct Leaf {
    v: Int;
    f: Bool?;
}

contract BinaryTree {
    root: Bush;
    init() {
        self.root = Bush{
            l: Leaf{v: 1, f: null},
            r: Leaf{v: 2, f: true}
        };
    }
}