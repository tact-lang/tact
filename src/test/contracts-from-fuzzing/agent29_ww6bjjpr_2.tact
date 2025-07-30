struct Inner {
    x: Int;
    y: Bool;
}

contract Test {
    point: Inner;

    init() {
        self.point = Inner{ x: 5, y: true };
    }
}