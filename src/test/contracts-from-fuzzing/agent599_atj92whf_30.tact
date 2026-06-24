struct Leaf { val: Int as uint8; }
struct Node { leaf: Leaf?; }

contract DeepSerializeNest {
    node: Node;
    init() {
        self.node = Node{leaf: Leaf{val:255}};
    }
}