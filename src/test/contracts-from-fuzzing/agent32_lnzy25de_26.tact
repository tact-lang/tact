struct Leaf {
    val: Int;
}

struct Branch {
    left: Leaf;
    right: Leaf;
}

struct Tree {
    root: Branch;
    label: String;
}

contract TestContract {
    tree: Tree;

    init() {
        self.tree = Tree{
            root: Branch{
                left: Leaf{ val: 10 },
                right: Leaf{ val: 20 },
            },
            label: "oak",
        };
    }
}