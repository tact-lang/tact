struct Inner {
    a: Int;
    b: Bool;
    c: String;
}

contract Test {
    field: Inner;

    init() {
        self.field = Inner{ a: 1, b: true, c: "ok" };
    }
}