struct OptionalStruct {
    intOpt: Int?;
    strOpt: String?;
    boolOpt: Bool?;
}

contract NullFields {
    f: OptionalStruct;

    init() {
        self.f = OptionalStruct{
            intOpt: null,
            strOpt: "hi",
            boolOpt: true
        };
    }
}