struct Inner {
    x: Int;
    y: Int?;
}

contract Test {
    data: Inner;

    init() {
        self.data = Inner{ x: 10, y: null };
    }
}