struct Leaf {
    val: Int? = null;
    flag: Bool? = true;
}

struct Node {
    leaf: Leaf;
    label: String;
}

contract TestContract {
    node: Node;

    init() {
        self.node = Node{
            leaf: Leaf{},
            label: "root",
        };
    }
}