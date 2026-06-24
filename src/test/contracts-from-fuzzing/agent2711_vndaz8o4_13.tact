struct OptionalStringStruct {
    val: String?;
}

contract OptionalStringField {
    data: OptionalStringStruct;

    init() {
        self.data = OptionalStringStruct{
            val: null,
        };
    }
}