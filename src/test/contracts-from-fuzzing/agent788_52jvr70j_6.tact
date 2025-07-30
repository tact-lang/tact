struct Leaf {
    foo: Int?;
    bar: Bool?;
    baz: String;
}

struct Middle {
    left: Leaf;
    right: Leaf?;
}

struct Root {
    first: Middle;
    second: Middle?;
}

contract TreeStorage {
    root: Root;

    init() {
        self.root = Root{
            first: Middle{
                left: Leaf{foo: null, bar: null, baz: "a"},
                right: null
            },
            second: null
        };
    }
}