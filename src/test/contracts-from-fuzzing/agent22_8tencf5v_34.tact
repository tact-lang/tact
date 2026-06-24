// Variant with inline default initializations for many nested optionals
struct Leaf {
    optInt: Int? = null;
    optBool: Bool? = null;
}

struct Node {
    left: Leaf? = null;
    right: Leaf? = null;
}

contract InlineDefaults {
    storage: Node;

    init() {
        self.storage = Node{};
    }
}