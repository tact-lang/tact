struct Inner {
    foo: Int;
}

contract TestContract {
    optInner: Inner?;

    init() {
        self.optInner = null;
    }
}