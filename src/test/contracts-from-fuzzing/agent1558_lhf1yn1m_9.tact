struct Leaf {
    x: Int;
}

struct Node {
    l: Leaf;
    r: Leaf;
    optLeaf: Leaf?;
}

struct Branch {
    left: Node;
    right: Node;
}

contract TreeContract {
    root: Branch;

    init() {
        self.root = Branch{
            left: Node{ l: Leaf{x:1}, r: Leaf{x:2}, optLeaf:null },
            right: Node{ l: Leaf{x:3}, r: Leaf{x:4}, optLeaf:null },
        };
    }
}
