struct Inner {
    z: Int;
}

struct Middle {
    c: Int;
    d: Inner;
    optInner: Inner?;
}

struct Outer {
    a: Int;
    b: Middle;
}

contract TestContract {
    nested: Outer;

    init() {
        self.nested = Outer{
            a: 1,
            b: Middle{
                c: 2,
                d: Inner{z:3},
                optInner: null,
            },
        };
    }
}