struct OptionalStruct {
    s: String?;
    b: Bool?;
    i: Int?;
}

contract OptionalPersist {
    os: OptionalStruct;

    init() {
        self.os = OptionalStruct{
            s: null,
            b: null,
            i: null
        };
    }
}