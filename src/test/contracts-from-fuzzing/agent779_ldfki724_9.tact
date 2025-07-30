struct Leaf {
    x: Int;
}

struct Branch {
    left: Leaf;
    right: Leaf;
}

struct Tree {
    root: Branch;
}

contract NestedTree {
    heap: Tree;

    init() {
        self.heap = Tree{
            root: Branch{
                left: Leaf{ x: 1 },
                right: Leaf{ x: 2 }
            }
        };
    }
}