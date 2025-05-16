struct Inner {
    a: Int;
    b: Bool;
    s: String;
    opt: Int?;
}

contract Test {
    nested: Inner;

    init() {
        self.nested = Inner{ a: 1, b: true, s: "hi", opt: null };
    }
}
