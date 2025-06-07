struct Inner {
    x: Int = 10;
    y: Bool = false;
}

contract Test2 {
    i: Inner = Inner{};

    init() {
        self.i = Inner{ x: 20, y: true };
    }
}