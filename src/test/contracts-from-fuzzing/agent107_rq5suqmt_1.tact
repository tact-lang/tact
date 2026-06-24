struct Inner {
    x: Int;
    y: Bool;
}

contract NestedTest {
    p: Inner;
    init() {
        self.p = Inner{ x: 42, y: false };
    }
}