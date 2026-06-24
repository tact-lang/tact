// Optional struct nested inside optional
struct Leaf {
    v: Int
}

struct Node {
    leaf: Leaf?;
}

contract NullableChain {
    chain: Node?;
    init() {
        self.chain = Node{
            leaf: Leaf{ v:42 }
        };
    }
}