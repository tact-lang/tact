struct Inner {
    nested: Int;
}

contract TestContract {
    data: Inner;

    init() {
        self.data = Inner{ nested: 5 };
    }
}