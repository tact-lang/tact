struct Leaf { n: Int; }

struct Branch {
    l: Leaf;
    r: Leaf;
}

struct Tree {
    left: Branch;
    right: Branch;
}

contract BinaryAgg {
    tree: Tree;

    init() {
        self.tree = Tree{
            left: Branch{l:Leaf{n:1}, r:Leaf{n:2}},
            right: Branch{l:Leaf{n:3}, r:Leaf{n:4}}
        };
    }
}
