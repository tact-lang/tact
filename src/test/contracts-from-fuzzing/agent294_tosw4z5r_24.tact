struct Leaf {
    s: String = "0123456789abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ";
}

struct Node {
    l1: Leaf = Leaf{};
    l2: Leaf = Leaf{};
    l3: Leaf = Leaf{};
    l4: Leaf = Leaf{};
    l5: Leaf = Leaf{};
}

contract BigDefaults {
    n: Node;

    init() {
        self.n = Node{};
    }
}
