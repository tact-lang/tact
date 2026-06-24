struct Inner {
    amount: Int;
    isActive: Bool;
}

contract Test {
    inner: Inner;

    init() {
        self.inner = Inner{
            amount: 10,
            isActive: true
        };
    }
}