struct Inner {
    x: Int = 10;
    y: Bool = false;
}

contract NestedStructContract {
    data: Inner = Inner{};
    init() {
        self.data = Inner{ x: 20, y: true };
    }
}