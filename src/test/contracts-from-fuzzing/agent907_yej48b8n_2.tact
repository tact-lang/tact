struct Inner {
    a: Int;
    b: Bool?;
}

struct Outer {
    inner: Inner;
    optInner: Inner?;
}

contract OptionalInNestedStruct {
    field: Outer;

    init() {
        self.field = Outer{
            inner: Inner{a: 10, b: true},
            optInner: null
        };
    }
}