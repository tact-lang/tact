struct OptionalInner {
    val: Int;
}

contract NullableStruct {
    inner: OptionalInner?;
    init() {
        self.inner = null;
    }
}