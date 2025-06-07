struct Inner {
    a: Int;
    b: Bool;
}

contract Test {
    point: Inner;
    init() {
        self.point = Inner{ a: 1, b: true };
    }
    receive() {}
}