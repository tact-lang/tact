struct DeepOptionalPtr {
    ptr: Int?;
}

contract OptionalDefaultNulls {
    foo: DeepOptionalPtr?;

    init() {
        self.foo = null;
    }
}