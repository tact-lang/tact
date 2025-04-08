struct Node {
    inner: NodeOpt?;
}

struct NodeOpt {
    leaf: Int;
}

contract RecursiveLooking {
    field: Node;

    init() {
        self.field = Node{
            inner: NodeOpt{
                leaf: 51
            }
        };
    }
}