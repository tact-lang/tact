struct OptionalStruct {
    a: Int?;
    b: Bool?;
}

contract OptionalStorage {
    field: OptionalStruct;

    init() {
        self.field = OptionalStruct{ a: null, b: null };
    }
}