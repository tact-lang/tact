struct Inner {
    x: Int;
}

contract TestContract {
    nestedField: Inner;

    init() {
        self.nestedField = Inner{ x: 55 };
    }
}