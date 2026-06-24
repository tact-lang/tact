struct InnerOptionalSerialized {
    val: Int? as uint8;
}

contract NestedOptSerialized {
    inner: InnerOptionalSerialized;

    init() {
        self.inner = InnerOptionalSerialized{ val: null };
    }
}