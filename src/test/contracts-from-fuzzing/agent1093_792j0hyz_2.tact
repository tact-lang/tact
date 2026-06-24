struct Inner {
    x: Int;
    y: Bool;
}

contract NestedStructTest {
    val: Inner;

    init() {
        self.val = Inner{ x: 12, y: true };
    }
}