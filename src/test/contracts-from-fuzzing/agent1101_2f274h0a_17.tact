struct Leaf {
    z: Int;
}

struct Middle {
    leaf: Leaf;
}

struct Top {
    mid: Middle?;
}

contract OptionalNest {
    s: Top;

    init() {
        self.s = Top{ mid: null };
    }
}