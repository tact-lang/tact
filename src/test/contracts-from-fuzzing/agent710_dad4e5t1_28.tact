struct Inner {
    foo: Int;
    bar: Bool?;
}

contract NestedOpt {
    v: Inner? = null;

    init() {
        self.v = Inner{ foo: 42, bar: true };
    }
}