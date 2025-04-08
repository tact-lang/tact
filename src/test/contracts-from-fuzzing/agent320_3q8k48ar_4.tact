struct Leaf {
    v: Int?;
    w: Bool?;
}

struct Node {
    a: Int;
    leaf: Leaf;
}

contract DeepOptional {
    data: Node;
    init() {
        self.data = Node{ a: 1, leaf: Leaf{ v: 100, w: false } };
    }
}