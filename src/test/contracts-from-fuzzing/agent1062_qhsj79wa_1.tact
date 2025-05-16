struct Inner {
    x: Int = 1;
    y: Bool?;
}

contract Test {
    data: Inner = Inner{};

    init() {
        self.data = Inner{ x: 10, y: true };
    }
}