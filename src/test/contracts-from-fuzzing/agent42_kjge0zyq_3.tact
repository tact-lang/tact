struct InnerMost {
    z: Int;
}

struct Inner {
    im: InnerMost?;
}

struct Outer {
    inner: Inner?;
}

contract DeepOptional {
    state: Outer;

    init() {
        self.state = Outer{
            inner: Inner{
                im: null
            }
        };
    }
}