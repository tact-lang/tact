struct LongNest {
    a: Int;
    b: Int?;
    c: Bool;
    d: String;
    e: Inner;
    f: InnerOption;
    g: Nested;
}

struct Inner {
    x: Int;
    y: Bool?;
}

struct InnerOption {
    opt: Inner?;
}

struct Nested {
    one: Inner;
    two: InnerOption;
}

contract Depth {
    big: LongNest;

    init() {
        self.big = LongNest{
            a: 5,
            b: null,
            c: true,
            d: "abc",
            e: Inner{x: 1, y: false},
            f: InnerOption{opt: null},
            g: Nested{one: Inner{x: 2, y: null}, two: InnerOption{opt: null}},
        };
    }
}