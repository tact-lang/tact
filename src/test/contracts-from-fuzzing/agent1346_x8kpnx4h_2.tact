struct InnerMost {
    x: Int;
    y: Int;
}

struct Middle {
    im: InnerMost;
    f: Bool;
}

struct Outer {
    m: Middle;
    d: Int;
}

contract NestedStructs {
    outer: Outer;

    init() {
        self.outer = Outer{
            m: Middle{
                im: InnerMost{x: 1, y: 2},
                f: true,
            },
            d: 42,
        };
    }
}