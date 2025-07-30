struct Leaf {
    x: Int?; y: Int?; z: Int?;
}

struct Middle {
    l1: Leaf?;
    l2: Leaf?;
}

struct Root {
    m1: Middle?;
    m2: Middle?;
}

contract AllDeepNullsImplicit {
    s: Root;

    init() {
        self.s = Root{};
    }
}