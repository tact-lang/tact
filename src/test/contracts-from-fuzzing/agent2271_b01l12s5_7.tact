struct NestedOptionalStruct {
    n: Int?;
    inner: Bool?;
}

contract OptionalInPersistent {
    s: NestedOptionalStruct?;

    init() {
        self.s = NestedOptionalStruct{
            n: 99,
            inner: null,
        };
    }
}