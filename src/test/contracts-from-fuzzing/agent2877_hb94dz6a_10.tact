struct Leaf {
    x: Int;
}

struct Branch {
    left: Leaf;
    right: Leaf;
}

struct Tree {
    root: Branch;
    side: Branch;
}

contract Forest {
    t1: Tree;
    t2: Tree;

    init() {
        self.t1 = Tree{
            root: Branch{left: Leaf{x:1}, right: Leaf{x:2}},
            side: Branch{left: Leaf{x:3}, right: Leaf{x:4}},
        };
        self.t2 = Tree{
            root: Branch{left: Leaf{x:5}, right: Leaf{x:6}},
            side: Branch{left: Leaf{x:7}, right: Leaf{x:8}},
        };
    }
}