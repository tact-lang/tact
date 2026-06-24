struct Inner {
    x: Int;
    y: Bool;
}

contract NestedTest {
    field: Inner;

    init() {
        self.field = Inner{ x: 7, y: true };
    }
}