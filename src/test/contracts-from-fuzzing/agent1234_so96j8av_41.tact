struct Leaf {
    name: String;
    x: Int as uint8;
    y: Int as int4;
}

struct Node {
    left: Leaf;
    right: Leaf;
}

contract DeepStruct {
    data: Node;

    init() {
        self.data = Node{
            left: Leaf{ name: "L", x: 5, y: -3 },
            right: Leaf{ name: "R", x: 7, y: 2 },
        };
    }
}