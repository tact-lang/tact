struct Leaf {
    val: Int?;
}

struct Mid {
    left: Leaf?;
    right: Leaf?;
}

struct Root {
    sub: Mid?;
    flag: Bool?;
}

contract OptionalTree {
    root: Root;

    init() {
        self.root = Root{
            sub: null,
            flag: null
        };
    }
}