struct Leaf {
    comment: String? = null;
    number: Int? = null;
}

struct Node {
    left: Leaf = Leaf{};
    right: Leaf? = null;
    label: String? = "node";
}

contract DeepOptionalDefaults {
    n: Node;

    init() {
        self.n = Node{};
    }
}
