struct MultiOptionals {
    intField: Int?;
    strField: String?;
    boolField: Bool?;
}

contract OptionalFields {
    optData: MultiOptionals;

    init() {
        self.optData = MultiOptionals{
            intField: null,
            strField: null,
            boolField: true
        };
    }
}