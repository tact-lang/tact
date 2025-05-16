struct InnerMost {
    val: Int;
}

struct Inner {
    im: InnerMost;
}

struct Outer {
    inner: Inner;
}

contract DeepNested {
    data: Outer;

    init() {
        self.data = Outer{
            inner: Inner{
                im: InnerMost{
                    val: 42
                }
            }
        };
    }
}