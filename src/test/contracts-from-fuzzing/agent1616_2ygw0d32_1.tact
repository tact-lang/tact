struct Inner {
    x: Int = 7;
    y: Bool = false;
}

contract TestContract {
    s: Inner = Inner{};

    init() {
        self.s = Inner{x: 10, y: true};
    }
}