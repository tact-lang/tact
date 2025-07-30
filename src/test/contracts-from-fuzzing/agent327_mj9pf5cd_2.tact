struct Inner {
    x: Int;
    y: Int;
}

contract Test {
    pt: Inner;

    init() {
        self.pt = Inner{ x: 10, y: 20 };
    }
}
