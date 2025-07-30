struct InnerMost {
    a: Int;
    b: Bool;
}

struct Middle {
    maybe: InnerMost?;
    flag: Bool;
}

struct Top {
    middle: Middle;
    c: Int;
}

contract OptionalNest {
    data: Top;

    init() {
        self.data = Top{
            middle: Middle{
                maybe: null,
                flag: true
            },
            c: 77
        };
    }
}
