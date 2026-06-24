struct Inner {
    a: Int = 10;
    b: Bool = false;
}

contract TestContract {
    data: Inner = Inner{};

    init() {
        self.data = Inner{ a: 123, b: true };
    }

    receive() {
        let _ = self.data.a + (self.data.b ? 1 : 0);
    }
}