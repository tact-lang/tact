struct InnerMost {
    val: Int;
}

struct Inner {
    s: InnerMost?;
}

struct Outer {
    inner: Inner?;
    testVal: Int;
}

contract NullNest {
    outer: Outer;

    init() {
        self.outer = Outer{
            inner: null,
            testVal: 5,
        };
    }
}