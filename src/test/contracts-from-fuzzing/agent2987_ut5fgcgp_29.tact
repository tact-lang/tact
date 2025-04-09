struct InnerWithDefaultOptional {
    a: Int? = null;
    b: Bool;
}

contract NestedDefaultOptional {
    inner: InnerWithDefaultOptional;

    init() {
        self.inner = InnerWithDefaultOptional { b: true };
    }
}
