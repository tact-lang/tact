struct OptionalStruct {
    a: Int?;
    b: Bool?;
    c: String?;
}

contract TestOptionalStruct {
    optData: OptionalStruct;

    init() {
        self.optData = OptionalStruct{
            a: null,
            b: true,
            c: null,
        };
    }
}