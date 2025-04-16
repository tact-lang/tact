struct Inner {
    f1: Int;
    f2: Bool;
}

contract FieldDefaults {
    inner: Inner;

    init() {
        self.inner = Inner{ f1: 42, f2: false };
    }
}