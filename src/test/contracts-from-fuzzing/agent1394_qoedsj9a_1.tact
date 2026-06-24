struct Inner {
    x: Int;
    y: Bool;
}

contract NestedStructVar {
    s: Inner;
    init() {
        self.s = Inner{ x: 10, y: true };
    }
}
