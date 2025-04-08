struct Leaf {
    x: Int;
    y: Bool;
    z: String;
}

struct Node {
    l1: Leaf;
    l2: Leaf;
}

contract Test {
    data: Node;

    init() {
        self.data = Node{
            l1: Leaf{ x: 1, y: true, z: "a" },
            l2: Leaf{ x: 2, y: false, z: "b" },
        };
    }
}