struct Leaf {
    x: Int = 0;
    y: Int = 0;
}

struct Node {
    label: String = "n";
    leaf: Leaf;
}

struct Root {
    flag: Bool = false;
    node: Node;
}

contract DeepNested {
    root: Root = Root{
        flag: true,
        node: Node{
            label: "node",
            leaf: Leaf{ x: 1, y: 2 }
        }
    };

    init() {
        self.root = Root{
            flag: false,
            node: Node{
                label: "updated",
                leaf: Leaf{ x: 3, y: 4 }
            }
        };
    }
}