struct Left {
    v: Int;
}

struct Right {
    w: Int;
}

struct TreeNode {
    left: Left?;
    right: Right?;
}

contract TreeContract {
    root: TreeNode;

    init() {
        self.root = TreeNode{
            left: Left{v:1},
            right: null,
        };
    }
}