struct Inner {
    a: Int;
    b: Bool;
    c: String?;
}

contract C {
    inner: Inner;
    init() {
        self.inner = Inner{
            a: 7,
            b: false,
            c: "hi",
        };
    }
    receive() {}
}