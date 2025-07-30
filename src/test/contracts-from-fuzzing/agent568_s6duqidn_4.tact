struct OptionalFields {
    a: Int?;
    b: Bool?;
    c: String?;
}

contract OptStruct {
    storage: OptionalFields;

    init() {
        self.storage = OptionalFields{
            a: null,
            b: true,
            c: null
        };
    }
}