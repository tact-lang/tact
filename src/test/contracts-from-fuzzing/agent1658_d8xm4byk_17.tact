struct LeafNode {
    val: Int;
    label: String;
}

struct TreeNode {
    left: LeafNode?;
    right: LeafNode?;
}

contract StorageTest {
    root: TreeNode;

    init() {
        self.root = TreeNode{
            left: LeafNode{ val:3, label:"L" },
            right: null
        };
    }
}