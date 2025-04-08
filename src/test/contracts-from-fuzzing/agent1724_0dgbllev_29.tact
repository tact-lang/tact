struct Leaf {
    v: Int;
}

struct Branch {
    left: Leaf;
    right: Leaf;
}

struct Root {
    l: Branch;
    r: Branch;
}

contract WideTree {
    root: Root;

    init() {
        self.root = Root{
            l: Branch{ left: Leaf{v:1}, right: Leaf{v:2} },
            r: Branch{ left: Leaf{v:3}, right: Leaf{v:4} }
        };
    }
}