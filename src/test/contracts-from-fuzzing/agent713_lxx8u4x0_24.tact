struct InnerStruct {
    foo: Int;
    bar: Bool;
}

contract OptionalOuter {
    inner: InnerStruct?;

    init() {
        self.inner = null;
    }
}