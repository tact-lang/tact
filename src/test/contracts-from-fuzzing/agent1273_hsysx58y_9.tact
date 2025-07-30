struct InnerMost {
    val: Int;
}

struct Inner {
    innerMost: InnerMost?;
}

struct Outer {
    inner: Inner?;
}

contract TestContract {
    outer: Outer;

    init() {
        self.outer = Outer{
            inner: Inner{
                innerMost: InnerMost{
                    val: 42
                }
            }
        };
    }
}