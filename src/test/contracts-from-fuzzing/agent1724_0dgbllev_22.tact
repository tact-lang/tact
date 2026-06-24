struct Inner {
    x: Int;
}

contract OptionalInline {
    nested: Inner?;

    init() {
        self.nested = null;
    }
}