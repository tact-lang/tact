struct NestedStringOpt {
    s: String?;
    inner: InnerStrOpt?;
}

struct InnerStrOpt {
    s2: String?;
}

contract OptionalStringNest {
    foo: NestedStringOpt;

    init() {
        self.foo = NestedStringOpt{
            s: null,
            inner: null
        };
    }
}