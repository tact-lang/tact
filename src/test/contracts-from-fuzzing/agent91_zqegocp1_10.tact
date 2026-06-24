struct Leaf {
    x: Int;
}

struct Branch {
    left: Leaf;
    right: Leaf;
}

struct Tree {
    root: Branch;
    opt: Branch?;
}

contract Test {
    data: Tree;

    init() {
        self.data = Tree{
            root: Branch{left: Leaf{x:1}, right: Leaf{x:2}},
            opt: null,
        };
    }
}