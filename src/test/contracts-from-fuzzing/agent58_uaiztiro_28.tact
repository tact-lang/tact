struct Leaf {
    val: Int;
}

struct OptionalNode {
    left: Leaf?;
    right: Leaf?;
}

contract OptionalTreePersistent {
    root: OptionalNode;

    init() {
        self.root = OptionalNode {
            left: null,
            right: Leaf{val:5}
        };
    }
}