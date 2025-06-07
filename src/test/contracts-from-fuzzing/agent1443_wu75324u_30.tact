struct Leaf {
    a: Int?;
    b: String?;
}

struct Inner {
    l1: Leaf;
    l2: Leaf;
}

struct Middle {
    inner: Inner;
    flag: Bool;
}

struct Root {
    mid: Middle;
    name: String;
}

contract ChainNestedDefaults {
    state: Root;

    init() {
        self.state = Root{
            mid: Middle{
                inner: Inner{
                    l1: Leaf{},
                    l2: Leaf{},
                },
                flag: true,
            },
            name: "hello",
        };
    }
}