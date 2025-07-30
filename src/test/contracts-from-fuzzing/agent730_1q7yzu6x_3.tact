struct Inner {
    a: Int;
    b: Bool;
    c: String;
}

contract WideFields {
    s: Inner;

    init() {
        self.s = Inner{ a: 1, b: true, c: "hello" };
    }
}
