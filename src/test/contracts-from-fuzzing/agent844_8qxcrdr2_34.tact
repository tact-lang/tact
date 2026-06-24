struct Inner {
    a: Int;
    b: Bool;
}

contract InlineNested {
    a: Int;
    b: Bool;
    nested: Inner;

    init() {
        self.a = 100;
        self.b = true;
        self.nested = Inner{a: 5, b: false};
    }

    receive() {
        let _ = self.a;
        let _ = self.b;
        let _ = self.nested;
    }
}