struct Inner {
    a: Int;
    b: Bool;
}

contract TestContract {
    maybeInner: Inner?;

    init() {
        self.maybeInner = null;
    }

    receive() {
        self.maybeInner = Inner{ a: 1, b: true };
    }
}