struct Inner {
    x: Int?;
}

contract TestContract {
    optInner: Inner?;

    init() {
        self.optInner = null;
    }
}