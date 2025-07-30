struct Inner {
    val: Int;
}

struct Outer {
    inner: Inner;
    optionalInner: Inner?;
}

contract TestContract {
    storage: Outer;

    init() {
        self.storage = Outer{
            inner: Inner{ val: 1 },
            optionalInner: null
        };
    }
}
