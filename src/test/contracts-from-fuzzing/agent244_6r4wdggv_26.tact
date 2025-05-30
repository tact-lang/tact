struct Layer {
    num: Int;
    flag: Bool;
}

struct Middle {
    a: Layer;
    b: Layer;
}

struct Top {
    mid: Middle;
}

contract DoubleNested {
    root: Top;

    init() {
        self.root = Top{
            mid: Middle{
                a: Layer{ num: 1, flag: true },
                b: Layer{ num: 2, flag: false }
            }
        };
    }
}