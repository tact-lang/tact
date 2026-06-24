struct Inner {
    x: Int;
    y: Int?;
}

contract Test {
    point: Inner;

    init() {
        self.point = Inner{ x: 10, y: 20 };
    }
}