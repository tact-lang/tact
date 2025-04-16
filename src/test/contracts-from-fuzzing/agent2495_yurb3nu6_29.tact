struct OptionalBoolStruct {
    b: Bool?;
}

contract OptBoolField {
    s: OptionalBoolStruct;

    init() {
        self.s = OptionalBoolStruct{ b: null };
    }
}