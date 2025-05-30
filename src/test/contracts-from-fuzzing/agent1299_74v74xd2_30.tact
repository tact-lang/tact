struct NodeB {
    x: Int;
}

struct NodeA {
    next: NodeB?;
}

contract LinearChain {
    root: NodeA;

    init() {
        self.root = NodeA{ next: null };
    }
}
