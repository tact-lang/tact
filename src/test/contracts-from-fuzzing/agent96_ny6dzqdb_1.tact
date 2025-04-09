struct Inner {
    a: Int;
    b: Bool;
    s: String;
}

contract Test {
    inner: Inner;

    init() {
        self.inner = Inner{
            a: 1,
            b: true,
            s: "abc",
        };
    }
}