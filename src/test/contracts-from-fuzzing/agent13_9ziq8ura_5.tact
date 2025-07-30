struct OptionalInner {
    intOpt: Int?;
    boolOpt: Bool?;
}

contract OptionalNested {
    foo: OptionalInner?;

    init() {
        self.foo = null;
    }
}