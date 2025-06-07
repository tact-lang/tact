// test nested optional struct with default = null
struct Leaf { val: Int; }
struct Node { leaf: Leaf? = null; }

contract TestContract {
    node: Node;
    init() {
        self.node = Node{};
    }
}