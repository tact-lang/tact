struct Inner {
    val: Int = 77;
}

contract TestContract {
    maybeInner: Inner?;

    init() {
        self.maybeInner = Inner{ val: 88 };
    }
}