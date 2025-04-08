// chain nested structs width-wise
struct Leaf {
    n: Int;
}

struct Node {
    l1: Leaf;
    l2: Leaf;
    l3: Leaf;
}

contract WidthNested {
    node: Node;
    init() {
        self.node = Node{
            l1: Leaf{n:1},
            l2: Leaf{n:2},
            l3: Leaf{n:3}
        };
    }
}