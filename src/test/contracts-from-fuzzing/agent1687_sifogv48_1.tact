struct Inner {
    a: Int;
    b: Bool;
    s: String;
}

contract Test {
    nested: Inner;

    init() {
        self.nested = Inner{ a: 1, b: true, s: "hi" };
    }
}
