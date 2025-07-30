struct Leaf { val: Int }
struct Node {
    left: Leaf?;
    right: Leaf?;
}
contract BinTree {
    root: Node;

    init() {
        self.root = Node{
            left: Leaf{val:1},
            right: Leaf{val:2},
        };
    }
}