struct TreeNode {
    val: Int;
    left: Bool?;
    right: String?;
}

contract TreeStructTest {
    node: TreeNode;

    init() {
        self.node = TreeNode{val: 1, left: null, right: null};
    }
}