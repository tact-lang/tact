struct Leaf {
    text: String;
}

struct Middle {
    val: Int;
    leaf1: Leaf;
    leaf2: Leaf;
}

struct Root {
    flag: Bool;
    mid: Middle;
}

contract Tree {
    root: Root;
    init() {
        self.root = Root{
            flag: true,
            mid: Middle{
                val: 77,
                leaf1: Leaf{ text: "left" },
                leaf2: Leaf{ text: "right" }
            }
        };
    }
}