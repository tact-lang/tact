struct Leaf {
    name: String;
    score: Int;
}

struct Node {
    leaf: Leaf?;
    valid: Bool;
}

contract OptChainTest {
    root: Node?;

    init() {
        self.root = Node{
            leaf: Leaf{
                name: "L",
                score: 100,
            },
            valid: true,
        };
    }
}