struct Leaf {
    x: Int;
}

struct Branch {
    l: Leaf;
    r: Leaf;
}

struct Tree {
    left: Branch;
    right: Branch;
}

contract TreeStructured {
    root: Tree;
    init() {
        self.root = Tree{
            left: Branch{
                l: Leaf{ x: 1 },
                r: Leaf{ x: 2 }
            },
            right: Branch{
                l: Leaf{ x: 3 },
                r: Leaf{ x: 4 }
            }
        };
    }
}