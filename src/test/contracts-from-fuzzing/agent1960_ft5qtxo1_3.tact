struct InnerMost {
    flag: Bool;
}

struct Middle {
    inner: InnerMost;
    message: String;
}

struct OuterMost {
    level: Middle;
    count: Int;
}

contract TripleNested {
    outer: OuterMost;

    init() {
        self.outer = OuterMost{
            level: Middle{
                inner: InnerMost{
                    flag: true,
                },
                message: "hi",
            },
            count: 5,
        };
    }
}