struct NestedOpt {
    foo: Int?;
    bar: String?;
}

contract OptionalStruct {
    inner: NestedOpt?;

    init() {
        self.inner = null;
    }
}