struct OptionalField {
    foo: Int?;
}

contract MultipleOptionalStructs {
    f1: OptionalField?;
    f2: OptionalField?;

    init() {
        self.f1 = null;
        self.f2 = null;
    }
}