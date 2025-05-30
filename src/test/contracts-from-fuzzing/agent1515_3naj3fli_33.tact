struct InnerWithSerialization {
    foo: Int as uint8;
    bar: Bool;
}

contract NestedSerialized {
    inner: InnerWithSerialization;

    init() {
        self.inner = InnerWithSerialization{
            foo: 42,
            bar: true,
        };
    }
}