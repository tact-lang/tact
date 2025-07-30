struct InnerMost {
    val: Int = 7;
    flag: Bool = true;
}

struct Inner {
    s: InnerMost;
    optVal: String?;
}

struct Outer {
    t: Inner;
    maybeCell: Cell?;
}

contract DeepNest {
    complex: Outer;

    init() {
        self.complex = Outer{
            t: Inner{
                s: InnerMost{},
                optVal: null,
            },
            maybeCell: null,
        };
    }

    receive() {}
}