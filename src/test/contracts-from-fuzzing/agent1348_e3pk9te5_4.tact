struct InnerMost {
    val: Int?;
}

struct Inner {
    sub: InnerMost?;
}

struct Outer {
    inner: Inner?;
}

contract DeepNestedOptionals {
    data: Outer;

    init() {
        self.data = Outer{
            inner: Inner{
                sub: InnerMost{
                    val: 42
                }
            }
        };
    }
}