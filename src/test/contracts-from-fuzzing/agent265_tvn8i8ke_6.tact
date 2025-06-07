struct Leaf {
    val: Int?;
}

struct Branch {
    left: Leaf?;
    right: Leaf?;
}

struct Tree {
    root: Branch?;
}

contract Test {
    data: Tree;

    init() {
        self.data = Tree{
            root: Branch{
                left: Leaf{ val: null },
                right: null,
            }
        };
    }
}