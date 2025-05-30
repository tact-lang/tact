struct Inner {
    x: Int;
    y: Bool;
}

contract NestedStructTest {
    s: Inner;

    init() {
        self.s = Inner { x: 5, y: true };
    }

    receive() {}
}