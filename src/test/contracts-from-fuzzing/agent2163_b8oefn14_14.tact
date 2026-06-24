struct OptionalStringInStruct {
    s: String?;
}

contract OptionalStringContainer {
    field: OptionalStringInStruct;

    init() {
        self.field = OptionalStringInStruct{
            s: null
        };
    }
}