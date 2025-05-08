struct OptionalBoolStruct {
    maybe: Bool?;
}

contract OptBoolField {
    data: OptionalBoolStruct;

    init() {
        self.data = OptionalBoolStruct{ maybe: null };
    }
}