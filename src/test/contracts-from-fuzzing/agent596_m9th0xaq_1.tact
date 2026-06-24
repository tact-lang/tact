struct Inner {
    a: Int;
    b: Bool;
}

contract SimpleTest {
    s: Inner;

    init() {
        self.s = Inner{ a: 1, b: true };
    }
}