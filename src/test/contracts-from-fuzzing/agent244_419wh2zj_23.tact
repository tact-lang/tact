// Persistent state with highly nested optionals and explicit null in contract storage
struct Leaf {
    leafVal: Int;
}

struct Node {
    leaf: Leaf?;
    note: String?;
}

contract DeepNullOptionals {
    root: Node?;

    init() {
        self.root = null;
    }
}