struct Leaf {
    val: Bool;
}

struct Branch {
    left: Leaf;
    right: Leaf;
}

struct Tree {
    root: Branch;
}

contract TreeStorage {
    t: Tree;

    init() {
        self.t = Tree{
            root: Branch{
                left: Leaf{ val: true },
                right: Leaf{ val: false }
            }
        };
    }
}