struct OptionalStruct {
    maybeInt: Int?;
    maybeFlag: Bool?;
}

contract HasOptionalStruct {
    data: OptionalStruct;

    init() {
        self.data = OptionalStruct{
            maybeInt: null,
            maybeFlag: true
        };
    }
}