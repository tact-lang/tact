struct OptionalStruct {
    inner: Int;
}

contract StructOptionalField {
    s: OptionalStruct?;

    init() {
        self.s = null;
    }
}