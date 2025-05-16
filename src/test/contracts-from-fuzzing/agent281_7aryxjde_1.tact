struct Inner {
    x: Int;
    y: Bool;
}

contract TestStorage {
    point: Inner;

    init() {
        self.point = Inner{ x: 1, y: true };
    }
}