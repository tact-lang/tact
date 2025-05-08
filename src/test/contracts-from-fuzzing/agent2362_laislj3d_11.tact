struct Outer {
    inner1: Inner;
    inner2: Inner;
    innerOpt: Inner?;
}

struct Inner {
    x: Int;
    y: Bool;
}

contract MultipleNestings {
    f: Outer;

    init() {
        self.f = Outer{
            inner1: Inner{ x: 1, y: true },
            inner2: Inner{ x: 2, y: false },
            innerOpt: null
        };
    }
}