struct OptionalStringStruct {
    message: String?;
}

contract NullableStringField {
    st: OptionalStringStruct;

    init() {
        self.st = OptionalStringStruct{message: null};
    }
}
