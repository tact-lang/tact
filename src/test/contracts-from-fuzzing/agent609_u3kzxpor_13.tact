struct OptionalStruct {
    a: Int?;
    b: Bool?;
}

contract OptStruct {
    field: OptionalStruct?;

    init() {
        self.field = OptionalStruct{ a: null, b: null };
    }
}