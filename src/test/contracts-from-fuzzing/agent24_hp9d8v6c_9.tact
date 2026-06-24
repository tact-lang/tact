struct InnerMost {
    a: Int;
    b: Bool;
    c: String;
}

struct Inner {
    d: InnerMost;
    maybeInnerMost: InnerMost?;
}

struct Outer {
    e: Inner;
    maybeInner: Inner?;
}

contract NestedOptionalTest {
    s: Outer;

    init() {
        self.s = Outer{
            e: Inner{
                d: InnerMost{
                    a: 1,
                    b: false,
                    c: "hello",
                },
                maybeInnerMost: null,
            },
            maybeInner: null,
        };
    }
}