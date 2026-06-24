struct InnerMost {
    z: Int;
}

struct Inner {
    y: InnerMost;
    opty: InnerMost?;
}

struct Outer {
    x: Inner;
    optx: Inner?;
}

contract ComplexNested {
    data: Outer;
    init() {
        self.data = Outer{
            x: Inner{
                y: InnerMost{z: 1},
                opty: null
            },
            optx: null
        };
    }
}