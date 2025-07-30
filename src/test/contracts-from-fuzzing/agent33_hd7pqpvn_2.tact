struct Inner {
    a: Bool;
    b: String;
}

contract Test {
    inner: Inner;

    init() {
        self.inner = Inner{
            a: true,
            b: "Nested",
        };
    }
}