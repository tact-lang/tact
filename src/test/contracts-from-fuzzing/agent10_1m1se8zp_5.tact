struct Inner {
    a: Int;
    b: Bool;
}

contract NestedOptional {
    optInner: Inner?;
    init() {
        self.optInner = null;
    }
}
