struct Inner {
    i: Int;
    b: Bool;
}

struct Middle {
    inner: Inner;
    opt_inner: Inner?;
}

contract NestedStructs {
    data: Middle;

    init() {
        self.data = Middle{
            inner: Inner{ i: 1, b: true },
            opt_inner: null
        };
    }
}