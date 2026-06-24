struct Inner {
    a: Int;
    b: Bool;
}

contract NestedOptionalField {
    optInner: Inner?;

    init() {
        self.optInner = null;
    }
}
