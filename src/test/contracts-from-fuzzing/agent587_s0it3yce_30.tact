struct Leaf {
    i: Int;
}

struct Branch {
    left: Leaf;
    right: Leaf;
}

contract BinaryTree {
    root: Branch;
    init() {
        self.root = Branch{
            left: Leaf{ i:1 },
            right: Leaf{ i:2 }
        };
    }
    receive() {
        let _ = self.root.left.i;
    }
}