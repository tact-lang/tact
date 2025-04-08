struct Deep {
    inner: Inner;
    optInner: Inner?;
}

struct Inner {
    val: Int;
}

contract TestContract {
    d: Deep;

    init() {
        self.d = Deep{
            inner: Inner{val: 1},
            optInner: null
        };
    }
}
