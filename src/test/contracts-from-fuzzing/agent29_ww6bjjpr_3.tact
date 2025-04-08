struct Inner {
    a: Bool;
    b: Bool;
    c: Bool;
    d: Bool;
    e: Bool;
    f: Bool;
    g: Bool;
    h: Bool;
    i: Bool;
}

contract Test {
    inner: Inner;

    init() {
        self.inner = Inner{
            a: true, b: false, c: true, d: false, e: true, f: false, g: true, h: false, i: true
        };
    }
}