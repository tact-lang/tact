struct Inner {
    a: Int;
    b: String;
}

struct Outer {
    inner: Inner;
    num: Int;
}

contract ManualNest {
    data: Outer;

    init() {
        self.data = Outer { inner: Inner { a:1, b:"x" }, num: 7 };
    }
}
