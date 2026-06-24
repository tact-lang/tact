struct OptionalBoolStruct {
    flag: Bool?;
}

contract OptionalBoolField {
    f: OptionalBoolStruct;

    init() {
        self.f = OptionalBoolStruct{ flag: null };
    }
}
