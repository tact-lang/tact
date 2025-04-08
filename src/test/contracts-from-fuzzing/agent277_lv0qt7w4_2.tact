struct Inner {
    x: Int;
    y: Int;
}

contract Test {
    s: Inner;
    init() {
        self.s = Inner{ x: 10, y: 20 };
    }
}