struct SubInner {
    z: Int;
}

struct Inner {
    w: Int;
    optSub: SubInner?;
}

struct Outer {
    i: Inner;
    y: Int;
}

contract ChainNest {
    store: Outer;

    init() {
        self.store = Outer{
            i: Inner {
                w: 1,
                optSub: SubInner {
                    z: 5,
                },
            },
            y: 7,
        };
    }
}
