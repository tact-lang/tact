struct Leaf {
    x: Int;
    y: Int;
}

struct Node {
    left: Leaf?;
    right: Leaf?;
}

contract OptionalNestedStructField {
    tree: Node?;

    init() {
        self.tree = null;
    }
}