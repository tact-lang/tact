struct InnerNodes {
    left: Int; 
    right: Int;
}

struct Tree {
    root: Int;
    children: InnerNodes;
}

contract BinaryTree {
    treeData: Tree;

    init() {
        self.treeData = Tree { root: 1, children: InnerNodes { left: 2, right: 3 } };
    }
}