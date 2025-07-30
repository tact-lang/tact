struct Leaf {
    x: Int;
    y: Int;
}

struct Node {
    l: Leaf;
    r: Leaf;
}

contract TestContract {
    node: Node;

    init() {
        self.node = Node{
            l: Leaf{ x:1, y:2 },
            r: Leaf{ x:3, y:4 }
        };
    }
}