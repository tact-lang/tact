struct Leaf {
    val: Int;
}

struct Branch {
    left: Leaf?;
    right: Leaf?;
}

struct Tree {
    root: Branch;
}

contract StructTree {
    storage: Tree;

    init() {
        self.storage = Tree{
            root: Branch{
                left: Leaf{ val: 1 },
                right: null,
            }
        };
    }
}
