struct Leaf {
    val: Int;
}

struct Middle {
    leaf: Leaf;
    optLeaf: Leaf?;
}

struct Root {
    middle: Middle;
    optMiddle: Middle?;
}

contract Test {
    data: Root;

    init() {
        self.data = Root{
            middle: Middle{
                leaf: Leaf{ val: 123 },
                optLeaf: null
            },
            optMiddle: null
        };
    }
}
