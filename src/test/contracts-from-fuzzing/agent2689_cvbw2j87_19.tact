struct OptionalStringStruct {
    msg: String?;
}

contract OptionalStringField {
    s: OptionalStringStruct;

    init() {
        self.s = OptionalStringStruct{
            msg: null,
        };
    }
}