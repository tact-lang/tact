struct Inner {
    foo: Int;
}

contract TestContract {
    optInt: Int?;
    optInner: Inner?;
    nested: Inner;

    init() {
        self.optInt = null;
        self.optInner = null;
        self.nested = Inner{ foo: 0 };
    }
}