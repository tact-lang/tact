struct Inner {
    foo: Int;
    bar: Bool;
}

contract TestStorage {
    inner: Inner;

    init() {
        self.inner = Inner{ foo: 77, bar: false };
    }
}