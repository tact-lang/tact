struct Leaf {
    val: Int;
}

struct Node {
    child: Leaf?;
}

contract TestContract {
    root: Node;

    init() {
        self.root = Node{
            child: null
        };
    }
}