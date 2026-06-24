struct Inner {
    x: Int;
    y: Bool;
}

struct Outer {
    inner1: Inner;
    inner2: Inner;
    optInner: Inner?;
}

contract TwoStructsOpt {
    data: Outer;

    init() {
        self.data = Outer {
            inner1: Inner { x:1, y:true },
            inner2: Inner { x:2, y:false },
            optInner: null,
        };
    }
}