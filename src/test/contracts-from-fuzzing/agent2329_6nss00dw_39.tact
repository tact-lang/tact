struct Leaf1 {
    x: Int;
}
struct Leaf2 {
    y: Bool;
}

struct Node {
    a: Leaf1;
    b: Leaf2;
}

contract TreeShapes {
    root: Node;

    init() {
        self.root = Node{
            a: Leaf1{ x:1 },
            b: Leaf2{ y:true }
        };
    }
}
