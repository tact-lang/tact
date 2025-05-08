struct Inner {
    s: String;
    b: Bool;
    i: Int;
}

contract StructDefaultField {
    inner: Inner;

    init() {
        self.inner = Inner{ s: "x", b: false, i: 42 };
    }
}