struct OptionalInner {
    foo: Int?;
    bar: Bool?;
}

contract NullDefaults {
    inner: OptionalInner;

    init() {
        self.inner = OptionalInner{
            foo: null,
            bar: null
        };
    }
}
