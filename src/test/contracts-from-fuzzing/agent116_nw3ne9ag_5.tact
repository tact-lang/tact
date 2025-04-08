contract NestedOptPrim {
    outer: Outer;

    init() {
        self.outer = Outer{
            middle: Middle{
                inner: Inner{
                    a: null,
                    b: true,
                    c: null
                },
                z: 99
            },
            y: 10
        };
    }
}

struct Outer {
    middle: Middle;
    y: Int;
}

struct Middle {
    inner: Inner;
    z: Int;
}

struct Inner {
    a: Int?;
    b: Bool;
    c: Bool?;
}
