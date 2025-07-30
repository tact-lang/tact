struct Deep {
    d1: Int;
    d2: Bool;
}

struct Inner {
    i1: Int;
    i2: Bool;
    deep: Deep;
}

struct Outer {
    inner: Inner;
    o1: Int;
}

contract DeeplyNestedStructTest {
    data: Outer;

    init() {
        self.data = Outer{
            inner: Inner{
                i1: 1,
                i2: false,
                deep: Deep{ d1: 7, d2: true },
            },
            o1: 42
        };
    }
}