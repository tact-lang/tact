struct Inner {
    a: Int;
    b: Bool = false;
}

contract Test {
    count: Int = 0;
    data: Inner;

    init() {
        self.data = Inner{ a: 99 };
        self.count = 5;
    }
}