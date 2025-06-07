struct Leaf {
    x: Int = 1;
    y: Bool = false;
}

struct Middle {
    leaf: Leaf = Leaf{};
    optLeaf: Leaf?;
}

struct Root {
    middle: Middle = Middle{};
    optMiddle: Middle?;
}

contract Test {
    store: Root = Root{};
    init() {
        self.store = Root{
            middle: Middle{
                leaf: Leaf{ x: 99, y: true },
                optLeaf: Leaf{ x: 55, y: false }
            },
            optMiddle: Middle{
                leaf: Leaf{ x: 11, y: true },
                optLeaf: null
            }
        };
    }
}