struct Leaf {
    x: Int;
}

struct Middle {
    leaf: Leaf;
}

struct Top {
    mid: Middle;
}

contract NullMiddleTest {
    state: Top;

    init() {
        self.state = Top{
            mid: Middle{
                leaf: Leaf{ x: 99 }
            }
        };
    }
}