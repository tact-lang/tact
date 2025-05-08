struct InnerLeaf {
    a: Int;
    b: Bool?;
}

struct InnerNode {
    leaf1: InnerLeaf;
    leaf2: InnerLeaf;
}

struct RootStruct {
    node: InnerNode;
    leafAgain: InnerLeaf;
}

contract Tree {
    root: RootStruct;

    init() {
        self.root = RootStruct{
            node: InnerNode{
                leaf1: InnerLeaf{a: 1, b: null},
                leaf2: InnerLeaf{a: 2, b: true}
            },
            leafAgain: InnerLeaf{a: 3, b: false}
        };
    }
}