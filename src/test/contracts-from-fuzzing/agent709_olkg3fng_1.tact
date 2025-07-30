struct Inner {
    x: Int;
    y: Bool;
}

contract TestContract {
    point: Inner;

    init() {
        self.point = Inner{ x: 5, y: true };
    }
}
