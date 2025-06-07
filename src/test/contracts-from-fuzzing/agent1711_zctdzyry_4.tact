struct OptionalStruct {
    val: Int;
}

contract TestStructOptionalField {
    data: OptionalStruct?;

    init() {
        self.data = null;
    }
}