struct InnerMost {
    z: Int;
}

struct Inner {
    y: InnerMost;
}

struct Mid {
    x: Inner;
}

struct Outer {
    mid: Mid;
    maybe_inner: Inner?;
}

contract TestContract {
    val: Outer;

    init() {
        self.val = Outer{
            mid: Mid{ x: Inner{ y: InnerMost{z:999} } },
            maybe_inner: null
        };
    }
}