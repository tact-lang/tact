struct OptionalString {
    s: String?;
}

contract OptionalStringStruct {
    field: OptionalString;

    init() {
        self.field = OptionalString{
            s: null
        };
    }
}