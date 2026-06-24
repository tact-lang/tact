struct Inner {
    a: Int = 1;
    b: Bool = false;
}

contract TestContract {
    data: Inner;

    init() {
        self.data = Inner{ a: 123, b: true };
    }

    receive() {
        self.data = Inner{ a: 7, b: false };
    }
}