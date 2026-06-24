struct InnerMost {
    foo: Int;
    bar: String?;
}

struct Inner {
    val: InnerMost;
}

struct Mid {
    inner: Inner;
}

struct Outer {
    mid: Mid;
}

contract LongNest {
    deep: Outer;

    init() {
        self.deep = Outer{
            mid: Mid{
                inner: Inner{
                    val: InnerMost{
                        foo: 42,
                        bar: null,
                    }
                }
            }
        };
    }
}