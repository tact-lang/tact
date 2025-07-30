struct Inner {
    a: Int;
    b: Bool;
    c: Int?;
}

contract Test {
    data: Inner;
    init() {
        self.data = Inner{ a: 1, b: true, c: null };
    }
}