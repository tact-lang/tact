struct OptionalStringStruct {
    s: String?;
}

contract OptionalStringField {
    opt: OptionalStringStruct?;

    init() {
        self.opt = OptionalStringStruct{ s: null };
    }
}
