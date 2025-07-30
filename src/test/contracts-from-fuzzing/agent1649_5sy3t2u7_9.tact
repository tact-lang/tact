struct SLeaf {
    value: Int;
}

struct SNode {
    left: SLeaf;
    right: SLeaf;
}

struct SRoot {
    node1: SNode;
    node2: SNode;
}

contract TreeStructured {
    root: SRoot;

    init() {
        self.root = SRoot{
            node1: SNode{ left: SLeaf{value:1}, right:SLeaf{value:2} },
            node2: SNode{ left: SLeaf{value:3}, right:SLeaf{value:4} }
        };
    }
}