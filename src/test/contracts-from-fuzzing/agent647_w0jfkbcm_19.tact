// deeply nested optional structs inside optional structs
struct Leaf {
    x: Int;
}

struct Node {
    child: Leaf?;
}

struct Root {
    node: Node?;
}

contract TestContract {
    root: Root?;

    init() {
        self.root = null;
    }
}