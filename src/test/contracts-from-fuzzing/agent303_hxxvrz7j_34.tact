struct InnerOptional {
    value: Int?;
}

contract NestedOptDirect {
    inner: InnerOptional;

    init() {
        self.inner = InnerOptional{ value: null };
    }
}