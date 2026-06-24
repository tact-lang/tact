struct Leaf {
    value: Int;
}

struct Middle {
    leaf: Leaf?;
}

struct Root {
    middle: Middle?;
}

contract OptionalDeepNest {
    data: Root;

    init() {
        self.data = Root{
            middle: null,
        };
    }
}