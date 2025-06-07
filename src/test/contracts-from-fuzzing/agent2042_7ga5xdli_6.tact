struct InnerMost {
    a: Int;
}

struct Middle {
    inner: InnerMost;
}

struct Top {
    x: Int;
    middle: Middle;
    y: Int?;
    s: String;
}

contract NestedMixed {
    data: Top;
    init() {
        self.data = Top{
            x: 1,
            middle: Middle{ inner: InnerMost{ a: 99 } },
            y: null,
            s: "foo"
        };
    }
}