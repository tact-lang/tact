struct Inner {
    x: Int;
}

contract Test {
    s: Inner;
    init() {
        self.s = Inner{ x: 1 };
    }
}