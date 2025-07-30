struct Leaf {
    val: Int;
}

struct Middle {
    left: Leaf?;
    right: Leaf?;
}

struct Root {
    first: Middle;
    second: Middle;
}

contract TreeStructure {
    root: Root;

    init() {
        self.root = Root{
            first: Middle{left: null, right: Leaf{val:1}},
            second: Middle{left: Leaf{val:2}, right: null},
        };
    }
}
