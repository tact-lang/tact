contract DeepNestedTest {
    data: Outer;

    init() {
        self.data = Outer{
            inner: Inner{
                value: 1,
                optionalInner: null
            },
            outerValue: 2
        };
    }
}

struct Outer {
    inner: Inner;
    outerValue: Int;
}

struct Inner {
    value: Int;
    optionalInner: Deeper?;
}

struct Deeper {
    deepValue: Int;
}