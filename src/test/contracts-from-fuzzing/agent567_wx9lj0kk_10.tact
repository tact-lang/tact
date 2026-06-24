struct Leaf {
    val: Int = 0;
    text: String = "x";
}

struct Node {
    left: Leaf;
    right: Leaf;
    optionalLeaf: Leaf?;
}

struct Tree {
    node1: Node;
    node2: Node;
    node3: Node;
}

contract TestTree {
    tree: Tree;
    init() {
        self.tree = Tree{
            node1: Node{
                left: Leaf{val: 1, text: "a"},
                right: Leaf{val: 2, text: "b"},
                optionalLeaf: null,
            },
            node2: Node{
                left: Leaf{val: 3, text: "c"},
                right: Leaf{val: 4, text: "d"},
                optionalLeaf: null,
            },
            node3: Node{
                left: Leaf{val: 5, text: "e"},
                right: Leaf{val: 6, text: "f"},
                optionalLeaf: null,
            },
        };
    }
}
