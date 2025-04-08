struct Leaf {
    v1: Int;
    v2: Bool?;
    v3: String;
    v4: String?;
}

struct Node {
    l1: Leaf;
    l2: Leaf?;
}

struct Root {
    n1: Node;
    n2: Node?;
}

contract DeepTree {
    root: Root;
    init() {
        self.root = Root{
            n1: Node{
                l1: Leaf{v1:1, v2:null, v3:"a", v4:null},
                l2: null
            },
            n2: null
        };
    }
}