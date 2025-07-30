struct SimpleInner {
    a: Int;
    b: Bool;
}

contract TestContract {
    data: SimpleInner;

    init() {
        self.data = SimpleInner{ a: 1, b: true };
    }
}