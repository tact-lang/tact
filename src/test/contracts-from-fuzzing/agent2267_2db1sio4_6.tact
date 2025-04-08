struct InnerLeaf {
    value: Int;
}

struct NodeLevel2 {
    left: InnerLeaf;
    right: InnerLeaf;
}

struct NodeLevel1 {
    left: NodeLevel2;
    right: NodeLevel2;
}

contract DeepTreeContract {
    root: NodeLevel1;

    init() {
        self.root = NodeLevel1{
            left: NodeLevel2{
                left: InnerLeaf{value: 1},
                right: InnerLeaf{value: 2}
            },
            right: NodeLevel2{
                left: InnerLeaf{value: 3},
                right: InnerLeaf{value: 4}
            }
        };
    }
}
