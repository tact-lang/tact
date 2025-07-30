struct Leaf {
    val: Int;
}

struct Branch {
    items: map<Int, Leaf>;
}

struct Tree {
    root: Branch;
}

contract MapOfStructs {
    tree: Tree;

    init() {
        self.tree = Tree{
            root: Branch{
                items: emptyMap()
            }
        };
    }
}