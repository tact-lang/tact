struct OptionalInside {
    val: Int?;
}

contract StructWithOptionalInside {
    inner: OptionalInside;

    init() {
        self.inner = OptionalInside{ val: null };
    }
}