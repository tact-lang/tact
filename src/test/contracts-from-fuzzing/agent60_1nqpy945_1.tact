struct Inner {
    a: Int;
}

contract TestContract {
    data: Inner;

    init() {
        self.data = Inner{ a: 1 };
    }
}