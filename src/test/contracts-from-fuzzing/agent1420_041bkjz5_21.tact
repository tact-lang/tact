struct Inner {
    x: Int;
}

contract TestContract {
    optInner: Inner?;

    init() {
        self.optInner = Inner{ x: 42 };
    }
}