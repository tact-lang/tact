struct Inner {
    a: Int;
    b: Bool;
}

contract TestContract {
    value: Inner;

    init() {
        self.value = Inner{ a: 5, b: true };
    }
}