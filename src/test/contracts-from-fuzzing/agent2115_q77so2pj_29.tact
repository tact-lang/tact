// optional structs with default null in nested chain
struct Leaf {
    n: Int = 42;
}

struct Node {
    next: Leaf?;
}

contract ChainOpt {
    node: Node? = null;
    init() {
        self.node = Node{ next: null };
    }
}