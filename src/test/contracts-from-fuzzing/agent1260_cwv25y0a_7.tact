struct Leaf {
    value: Int = 1;
}

struct Node {
    left: Leaf = Leaf{};
    right: Leaf = Leaf{};
}

struct Root {
    level1: Node = Node{};
    level2: Node = Node{};
}

contract DeepWide {
    tree: Root = Root{};

    init() {
        self.tree = Root{
            level1: Node{
                left: Leaf{ value: 11 },
                right: Leaf{ value: 12 }
            },
            level2: Node{
                left: Leaf{ value: 21 },
                right: Leaf{ value: 22 }
            }
        };
    }
}