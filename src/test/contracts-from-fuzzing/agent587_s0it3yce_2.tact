struct Inner {
    x: Int;
    y: Bool;
}

contract Test {
    point: Inner;
    init() {
        self.point = Inner{ x: 1, y: true };
    }
    receive() {
        let _ = self.point.x;
    }
}