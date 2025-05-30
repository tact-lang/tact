struct Inner {
    x: Int;
    y: Bool;
}

contract NestedStructStorage {
    point: Inner;

    init() {
        self.point = Inner{ x: 42, y: true };
    }
}