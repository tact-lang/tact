// Optional nested struct tree again, now assign inner nested values non-null
struct Leaf { id: Int?; }
struct Node { leaf: Leaf?; }

contract OptionalNestedNonNull {
    node: Node?;

    init() {
        self.node = Node{
            leaf: Leaf{ id: null }
        };
    }
}