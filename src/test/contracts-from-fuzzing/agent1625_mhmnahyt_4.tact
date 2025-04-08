struct OptionalStruct {
    a: Int?;
    b: Bool?;
}

contract OptionalFieldsStorage {
    s: OptionalStruct;

    init() {
        self.s = OptionalStruct{
            a: null,
            b: true,
        };
    }
}
