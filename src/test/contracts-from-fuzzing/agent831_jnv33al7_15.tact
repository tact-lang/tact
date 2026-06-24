struct OptionalInner {
    s: String?;
}

contract StructWithOptionalString {
    val: OptionalInner;
    init() {
        self.val = OptionalInner{ s: null };
    }
}