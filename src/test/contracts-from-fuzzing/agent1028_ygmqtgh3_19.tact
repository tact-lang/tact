struct Leaf {
    a: Int? = null;
    b: String = "leaf";
}

struct Middle {
    left: Leaf;
    right: Leaf;
}

contract BigStorage {
    root: Middle;

    init() {
        self.root = Middle{
            left: Leaf{a: 7, b: "L"},
            right: Leaf{}
        };
    }
}