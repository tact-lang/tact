struct InnerMost {
    z: Int;
}

struct Inner {
    y: Int;
    im: InnerMost;
}

struct Wrapper {
    x: Int;
    nested: Inner;
}

contract TestContract {
    w: Wrapper;

    init() {
        self.w = Wrapper{
            x: 1,
            nested: Inner{
                y: 2,
                im: InnerMost{
                    z: 3
                }
            }
        };
    }
}