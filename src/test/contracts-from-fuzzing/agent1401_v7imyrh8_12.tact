struct InnerMost {
    x: Int;
}

struct Inner {
    a: Int;
    b: InnerMost;
}

struct Outer {
    p: Bool;
    q: Inner;
}

contract MultiDeep {
    state: Outer;

    init() {
        self.state = Outer{
            p: true,
            q: Inner{
                a: 10,
                b: InnerMost{ x: 99 },
            },
        };
    }
}