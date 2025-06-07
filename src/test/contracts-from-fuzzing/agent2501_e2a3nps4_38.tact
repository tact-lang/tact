struct Inner {
    foo: Int;
    bar: Int = 7;
}

contract SetInInit {
    inner: Inner;

    init() {
        self.inner = Inner{ foo: 5 };
    }
}