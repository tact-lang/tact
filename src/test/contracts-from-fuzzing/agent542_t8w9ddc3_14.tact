struct Leaf {
    x: Int = 77;
    y: Bool?; // implicit null
}

struct Node {
    leaf: Leaf;
    flag: Bool = false;
    optStr: String?; // implicit null
}

contract MixedDefaults {
    data: Node;

    init() {
        self.data = Node{
            leaf: Leaf{ x: 99, y: null },
            flag: true,
            optStr: null
        };
    }
}