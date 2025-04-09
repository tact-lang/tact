struct InnerStruct {
    value: Int;
}

contract OptionalInnerStruct {
    inner: InnerStruct?;

    init() {
        self.inner = InnerStruct{value:42};
    }
}