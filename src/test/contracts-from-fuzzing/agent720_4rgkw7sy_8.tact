struct Leaf {
    a: Int;
    b: Bool;
}

struct Branch {
    left: Leaf;
    right: Leaf;
}

struct Tree {
    root: Branch;
    branch2: Branch;
}

contract TreeTest {
    tree: Tree;

    init() {
        self.tree = Tree{
            root: Branch{
                left: Leaf{ a: 1, b: true },
                right: Leaf{ a: 2, b: false }
            },
            branch2: Branch{
                left: Leaf{ a: 3, b: true },
                right: Leaf{ a: 4, b: false }
            }
        };
    }
}