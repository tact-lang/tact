struct InnerS {
    foo: Int? as uint16;
}

contract OptionalNestedSerialized {
    s: InnerS;

    init() {
        self.s = InnerS{ foo: null };
    }
}