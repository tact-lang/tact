struct Leaf {
    i: Int as uint8 = 1;
    j: Bool? = null;
}

struct Node {
    leaf: Leaf = Leaf{};
    label: String? = null;
}

contract Test {
    tree: Node?;

    init() {
        self.tree = Node{};
    }
}