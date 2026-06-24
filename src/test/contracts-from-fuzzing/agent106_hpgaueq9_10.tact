// Test struct with nested optionals, no top-level optionals
struct Leaf {
    value: Int?;
    flag: Bool;
}

struct Node {
    left: Leaf;
    right: Leaf;
}

contract NoOptionalsTop {
    root: Node = Node{
        left: Leaf{ value: null, flag: false },
        right: Leaf{ value: 42, flag: true }
    };

    receive() {}
}