struct X {
    i: Int;
    b: Bool;
    s: String;
}

contract InitStructDirect {
    inner: X;
    init() {
        self.inner = X{ i: 7, b: true, s: "hello" };
    }
}