struct Leaf { value: Int }

struct Node {
    left: Leaf?;
    right: Leaf?;
}

struct Root {
    node: Node?;
}

contract TestContract {
    root: Root;

    init() {
        self.root = Root{
            node: Node{
                left: null,
                right: Leaf{ value: 123 }
            }
        };
    }
}
