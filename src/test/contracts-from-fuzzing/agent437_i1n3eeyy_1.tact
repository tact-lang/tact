struct Inner {
    x: Int = 10;
    y: Bool = true;
}

contract NestedContract {
    data: Inner = Inner{};

    init() {
        self.data = Inner{x: 5, y: false};
    }

    receive() {
        let _ = self.data.x;
    }
}