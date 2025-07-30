struct Leaf {
    amount: Int as coins;
}

struct Middle {
    small: Int as uint32;
    leaf: Leaf;
}

struct Root {
    mid: Middle;
    big: Int as int64;
}

contract Test {
    data: Root;

    init() {
        self.data = Root{
            mid: Middle{ small: 1, leaf: Leaf{ amount: 1000 } },
            big: 5000
        };
    }
}