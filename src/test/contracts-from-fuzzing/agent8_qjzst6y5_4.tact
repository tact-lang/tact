struct OptionalInner {
    val: Int?;
}

contract OptionalInStruct {
    inner: OptionalInner;

    init() {
        self.inner = OptionalInner{ val: null };
    }
}