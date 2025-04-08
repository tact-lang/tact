struct OptionalStruct {
    a: Int?;
    b: Bool?;
    c: String?;
}

contract OptStructPersistent {
    optField: OptionalStruct;

    init() {
        self.optField = OptionalStruct{
            a: null,
            b: null,
            c: null
        };
    }
}
