struct Leaf {
    x: Int as uint4;
    y: Bool?;
}

struct Middle {
    l: Leaf?;
    s: String;
}

struct Top {
    m: Middle?;
    flag: Bool;
}

contract ComplexDeepNestedFixed {
    data: Top;

    init() {
        self.data = Top{
            m: Middle{
                l: Leaf{
                    x: 10,
                    y: null,
                },
                s: "payload",
            },
            flag: false,
        };
    }
}
