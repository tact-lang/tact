struct Leaf {
    a: Int = 5;
    b: Bool?;
}

struct Node {
    x: Int = 1;
    y: Leaf = Leaf{};
    z: Bool = true;
}

struct Root {
    q: Int?;
    left: Node = Node{};
    right: Node = Node{};
}

contract TestContract {
    tree: Root;
    init() {
        self.tree = Root{
            q: 42,
            left: Node{
                x: 100,
                y: Leaf{a: 200, b: false},
                z: false
            },
            right: Node{}
        };
    }
}