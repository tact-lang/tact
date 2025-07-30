struct Inner {
    x: Int;
    y: Int;
}

contract NestedStructField {
    point: Inner;

    init() {
        self.point = Inner{ x: 1, y: 2 };
    }
}
