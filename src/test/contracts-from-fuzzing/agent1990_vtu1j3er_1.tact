struct Inner {
    x: Int;
    y: Bool?;
}

contract NestedStructs {
    point: Inner;

    init() {
        self.point = Inner{ x: 42, y: null };
    }
}
