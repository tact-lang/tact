struct Inner {
    x: Int = 10;
    y: Bool = false;
}

contract TestContract {
    data: Inner;

    init() {
        self.data = Inner{ x: 42, y: true };
    }

    receive() {
        self.data = Inner{ x: self.data.x + 1, y: self.data.y };
    }
}