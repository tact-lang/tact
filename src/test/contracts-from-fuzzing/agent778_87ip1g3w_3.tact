struct Inner {
    x: Int;
    y: Bool;
}

contract NestedStructTest {
    inner: Inner;
    init() {
        self.inner = Inner{ x: 7, y: true };
    }
}