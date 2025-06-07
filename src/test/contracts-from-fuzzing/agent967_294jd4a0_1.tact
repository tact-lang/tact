struct Inner {
    a: Int;
    b: Bool;
}

contract NestedStructTest {
    s: Inner;

    init() {
        self.s = Inner{ a: 1, b: true };
    }
}