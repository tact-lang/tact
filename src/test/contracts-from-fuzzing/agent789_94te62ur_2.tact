struct Inner {
    a: Int;
    b: Bool;
    c: String;
}

contract NestedTest {
    s: Inner;

    init() {
        self.s = Inner {
            a: 10,
            b: true,
            c: "hi"
        };
    }
}
