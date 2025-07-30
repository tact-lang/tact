struct LeafNode {
    x: Int;
    y: Int;
}

struct BranchNode {
    left: LeafNode?;
    right: LeafNode?;
}

contract NullableLeafTree {
    root: BranchNode;

    init() {
        self.root = BranchNode{
            left: null,
            right: LeafNode{x: 1, y: 2},
        };
    }
}
