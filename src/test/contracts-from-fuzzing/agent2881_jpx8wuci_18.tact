struct StructWithOptionalInner {
    inner: Int?;
}

contract OptionalInnerNullDefault {
    s: StructWithOptionalInner;

    init() {
        self.s = StructWithOptionalInner{};
    }
}