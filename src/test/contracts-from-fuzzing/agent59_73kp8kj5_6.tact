struct Inner {
    x: Int;
    y: Bool;
}

contract NestedStructVar {
    data: Inner;

    init() {
        self.data = Inner { x: 1, y: true };
    }
}
