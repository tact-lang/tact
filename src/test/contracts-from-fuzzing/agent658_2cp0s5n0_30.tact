struct Leaf {
    n: Int;
}

struct Branch {
    l: Leaf;
    r: Leaf;
}

struct Tree {
    left: Branch;
    right: Branch;
    center: Branch;
}

contract TreeTest {
    t: Tree;

    init() {
        self.t = Tree{
            left: Branch{ l: Leaf{n: 1}, r: Leaf{n: 2} },
            right: Branch{ l: Leaf{n: 3}, r: Leaf{n: 4} },
            center: Branch{ l: Leaf{n: 5}, r: Leaf{n: 6} }
        };
    }
}