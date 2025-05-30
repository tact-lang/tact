struct Leaf { val: String?; }
struct Node { leaf: Leaf; num: Int; }

contract DeepNest {
    field: Node;
    init() {
        self.field = Node{
            leaf: Leaf{ val: null },
            num: 42,
        };
    }
    receive() {}
}