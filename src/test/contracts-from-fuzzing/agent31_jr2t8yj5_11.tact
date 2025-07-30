struct Inner {
    a: Int;
    b: Int?;
}

contract Test {
    f: Inner;
    g: Inner?;

    init() {
        self.f = Inner{ a: 1, b: null };
        self.g = null;
    }
}
