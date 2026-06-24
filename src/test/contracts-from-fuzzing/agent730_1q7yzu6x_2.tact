struct Inner {
    x: Int;
    y: Int?;
}

contract NestedOptionalFields {
    point: Inner;

    init() {
        self.point = Inner{ x: 5, y: null };
    }
}
