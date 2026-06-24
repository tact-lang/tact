struct Inner {
    x: Int = 1;
    y: Bool = false;
}

contract TestNested {
    point: Inner = Inner{};

    init() {
        self.point = Inner{x: 42, y: true};
    }
}