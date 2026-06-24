struct Leaf {
    v: Int?;
}

struct Node {
    left: Leaf?;
    right: Leaf?;
}

contract Test {
    f: Node?;
}