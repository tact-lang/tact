struct Inner {
    a: Int;
    b: Bool;
    c: String;
}

contract NestedTest {
    nested: Inner;

    init() {
        self.nested = Inner{
            a: 42,
            b: false,
            c: "hi",
        };
    }

    receive() {}
}
