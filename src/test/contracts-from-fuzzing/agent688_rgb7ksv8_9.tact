struct Leaf {
    x: Int = 7;
    y: Bool?;
    z: String?;
}

struct Node {
    leaf: Leaf;
    label: String = "";
    enabled: Bool?;
}

struct Root {
    node: Node;
    meta: String = "meta";
}

contract MixedDeep {
    root: Root;

    init() {
        self.root = Root{
            node: Node{
                leaf: Leaf{
                    y: true
                }
            }
        };
    }
}
