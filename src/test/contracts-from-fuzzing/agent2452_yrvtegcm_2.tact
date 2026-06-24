struct Inner {
    value: Int;
}

struct Outer {
    inner: Inner;
    optionalInner: Inner?;
}

contract NestedStructs {
    data: Outer;

    init() {
        self.data = Outer{
            inner: Inner{value: 1},
            optionalInner: null
        };
    }
}