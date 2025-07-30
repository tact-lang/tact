struct OptionalStringStruct {
    content: String?;
}

contract OptionalStringContract {
    field: OptionalStringStruct;

    init() {
        self.field = OptionalStringStruct{
            content: null,
        };
    }
}