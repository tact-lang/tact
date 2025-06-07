struct OptionalStruct {
    x: Int?;
}

contract FieldIsOptionalStruct {
    data: OptionalStruct?;
    init() {
        self.data = null;
    }
}