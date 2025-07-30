struct Leaf {
    val: Int;
}

struct Node {
    left: Leaf;
    right: Leaf;
}

struct Root {
    lnode: Node;
    rnode: Node;
}

contract DeepTree {
    tree: Root = Root{
        lnode: Node{
            left: Leaf{val:1},
            right: Leaf{val:2}
        },
        rnode: Node{
            left: Leaf{val:3},
            right: Leaf{val:4}
        }
    };

    receive() {
        let total = self.tree.lnode.left.val + self.tree.lnode.right.val + self.tree.rnode.left.val + self.tree.rnode.right.val;
    }
}