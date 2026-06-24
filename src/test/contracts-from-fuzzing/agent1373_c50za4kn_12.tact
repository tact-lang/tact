struct Node {
    val: Int;
}

struct Container {
    left: Node;
    right: Node;
}

contract Test {
    tree: Container;

    init() {
        self.tree = Container{
            left: Node{ val: 1 },
            right: Node{ val: 2 }
        };
    }
}