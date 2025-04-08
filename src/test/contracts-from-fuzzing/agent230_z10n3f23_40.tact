struct OptionalInner {
    val: Int?;
}

contract OptionInnerStruct {
    inner: OptionalInner?;

    init() {
        self.inner = null;
    }
}
