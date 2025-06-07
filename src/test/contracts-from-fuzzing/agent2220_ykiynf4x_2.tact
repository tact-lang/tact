struct Inner {
    x: Int;
}

contract Test {
    f: Inner;

    init() {
        self.f = Inner{ x: 0 };
    }
}