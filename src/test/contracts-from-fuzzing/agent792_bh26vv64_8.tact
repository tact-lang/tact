struct Leaf {
    val: Int;
}

struct Node {
    leaf: Leaf;
}

struct Root {
    node: Node;
}

contract TestContract {
    rootOpt: Root?;

    init() {
        self.rootOpt = Root{ node: Node{ leaf: Leaf{ val: 12345 } } };
    }
}