struct Leaf {
    x: Int?;
    y: Bool?;
}

struct Middle {
    leaf: Leaf?;
}

contract NestedSparse {
    m: Middle;

    init() {
        self.m = Middle{ leaf: Leaf{ x: null, y: true } };
    }
}