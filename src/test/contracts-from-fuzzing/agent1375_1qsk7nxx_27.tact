contract NestedOptionStructDefaults {
    s: Outer;

    init() {
        self.s = Outer{
            middle: Middle{
                inner: Inner{a: null},
                b: true,
            },
            c: "ok",
        };
    }
}

struct Inner {
    a: Int?;
}

struct Middle {
    inner: Inner;
    b: Bool;
}

struct Outer {
    middle: Middle;
    c: String;
}