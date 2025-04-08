struct Leaf {
    data: Slice as remaining;
}

struct Node {
    leaf: Leaf;
    id: Int;
}

struct Root {
    node: Node;
    val: Int;
}

contract TestContract {
    root: Root;

    init() {
        self.root = Root{
            node: Node{
                leaf: Leaf{ data: emptyCell().asSlice() },
                id: 1
            },
            val: 2
        };
    }
}