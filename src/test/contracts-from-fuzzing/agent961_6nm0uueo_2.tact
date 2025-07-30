struct Inner {
    a: Int;
    b: Bool;
}

contract NestedStructContract {
    data: Inner;

    init() {
        self.data = Inner{ a: 10, b: true };
    }
}