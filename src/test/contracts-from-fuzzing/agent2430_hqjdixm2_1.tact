struct Inner {
    value: Int;
}

contract TestContract {
    data: Inner;

    init() {
        self.data = Inner{ value: 42 };
    }
}
