struct Inner {
    x: Int;
    y: Bool = false;
}

contract TestContract {
    data: Inner;

    init() {
        self.data = Inner{ x: 42 };
    }
}