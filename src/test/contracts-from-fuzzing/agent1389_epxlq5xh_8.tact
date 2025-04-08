struct InnerMost {
    str: String;
    f: Bool;
}

struct Middle {
    a: Int;
    inner: InnerMost;
}

struct Outer {
    mid: Middle;
    s: String?;
}

contract DeepestNest {
    hold: Outer;

    init() {
        self.hold = Outer{
            mid: Middle{
                a: 100,
                inner: InnerMost{ str: "inner", f: true }
            },
            s: null,
        };
    }
}