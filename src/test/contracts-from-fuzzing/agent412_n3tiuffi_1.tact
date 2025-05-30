struct Inner {
    a: Int;
}

contract Test {
    data: Inner;
    init() {
        self.data = Inner{ a: 1 };
    }
}