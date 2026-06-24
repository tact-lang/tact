struct Leaf {
    x: Int as uint8;
    y: Bool;
}

struct Branch {
    left: Leaf;
    right: Leaf?;
}

struct Tree {
    root: Branch;
    tag: Int as int64;
}

contract SerializeNest {
    treeData: Tree;

    init() {
        self.treeData = Tree{
            root: Branch{
                left: Leaf{ x: 42, y: true },
                right: null,
            },
            tag: -12345,
        };
    }
}