struct Middle {
    field: Int;
    inner: Inner;
}

struct Inner {
    optVal: Int?;
}

contract TestContract {
    m: Middle;
    init() {
        self.m = Middle{
            field: 5,
            inner: Inner{ optVal: null }
        };
    }
}