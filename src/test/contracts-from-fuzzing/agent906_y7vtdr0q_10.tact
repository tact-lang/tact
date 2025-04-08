struct S0 {
    b: Bool;
    s: String;
}

struct S1 {
    z: Int;
    inner: S0;
    optInner: S0?;
}

contract NestedWide {
    data: S1;

    init() {
        self.data = S1{
            z: 2,
            inner: S0{ b: true, s: "abc" },
            optInner: null,
        };
    }
}