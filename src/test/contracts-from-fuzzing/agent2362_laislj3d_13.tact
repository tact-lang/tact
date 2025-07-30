struct Leaf {
    val: Int;
}

struct Br {
    left: Leaf;
    right: Leaf;
}

struct Tree {
    branch: Br;
    optionalLeaf: Leaf?;
}

contract BinaryTreeTest {
    f: Tree;

    init() {
        self.f = Tree{
            branch: Br{
                left: Leaf{ val:1 },
                right: Leaf{ val:2 }
            },
            optionalLeaf: null
        };
    }
}