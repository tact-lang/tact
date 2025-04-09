struct InnerMost {
    v: Int;
}

struct Inner {
    im: InnerMost?;
}

struct Outer {
    i: Inner;
}

contract DeepChainOpt {
    state: Outer;
    init() {
        self.state = Outer{
            i: Inner{
                im: null,
            },
        };
    }
}