struct Leaf { val: Int }

struct Node {
    left: Leaf?;
    right: Leaf?;
}

contract TestContract {
    root: Node;

    init() {
        self.root = Node{
            left: null,
            right: Leaf{ val: 42 }
        };
    }
}