// Test deeply nested struct with default values only
struct Leaf {
    value: Int = 5;
}

struct Node {
    left: Leaf = Leaf{};
    right: Leaf = Leaf{};
}

struct Tree {
    root: Node = Node{};
}

contract DeepDefaults {
    data: Tree;

    init() {
        self.data = Tree{};
    }
}
