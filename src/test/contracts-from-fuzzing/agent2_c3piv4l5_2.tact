struct Inner {
    a: Int;
    b: Bool;
    c: String;
}

contract TestContract {
    nested: Inner;

    init() {
        self.nested = Inner{ a: 1, b: true, c: "hi" };
    }
}
