struct Inner {
    a: Int;
    b: Bool;
}

contract TestContract {
    maybeInner: Inner? = null;

    receive() {
        if (self.maybeInner == null) {
            self.maybeInner = Inner{ a: 2, b: false };
        } else {
            self.maybeInner = null;
        }
    }
}