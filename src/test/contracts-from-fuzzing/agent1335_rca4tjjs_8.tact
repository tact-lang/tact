struct Inner {
    s: String?;
    n: Int;
}

struct Outer {
    inner: Inner;
    b: Bool;
}

contract ImplicitNulls {
    val: Outer;
    init() {
        self.val = Outer{
            inner: Inner{
                n: 42,
            },
            b: false,
        };
    }
    receive() {}
}