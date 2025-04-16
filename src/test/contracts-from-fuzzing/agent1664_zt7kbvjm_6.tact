struct Leaf {
    val: Int;
}

struct Middle {
    leaf: Leaf;
}

struct Root {
    mid: Middle;
}

contract DeepNest {
    root: Root;

    init() {
        self.root = Root{ mid: Middle{ leaf: Leaf{ val: 7 } } };
    }
}