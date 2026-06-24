struct Leaf {
    val: Int;
}

struct Node {
    child: Leaf?;
}

contract OptionalDeep {
    root: Node?;

    init() {
        self.root = Node{ child: Leaf{ val: 123 } };
    }
}