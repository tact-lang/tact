struct InnerMost {
    v: Int;
}

struct Inner {
    x: InnerMost;
}

struct Middle {
    y: Inner;
}

struct Outer {
    z: Middle;
}

contract SuperDeep {
    state: Outer;

    init() {
        self.state = Outer{
            z: Middle{
                y: Inner{
                    x: InnerMost{
                        v: 42,
                    },
                },
            },
        };
    }
}